defmodule TaskAwaiter do
  use GenServer

  defstruct [:state, :condition_verifier, :result_acceptor, :awaiter_notifier]

  # API
  def start_link(initial_state, condition_verifier, result_acceptor, awaiter_notifier, gen_server_options \\ []) do
    GenServer.start_link(__MODULE__, [initial_state, condition_verifier, result_acceptor, awaiter_notifier], gen_server_options)
  end

  def task_completed(server, result) do
    server |> GenServer.cast({:accept_result, result})
  end

  # Callbacks
  def init([initial_state, condition_verifier, result_acceptor, awaiter_notifier]) do
    {:ok, %TaskAwaiter{state: initial_state, condition_verifier: condition_verifier, result_acceptor: result_acceptor, awaiter_notifier: awaiter_notifier}}
  end

  def handle_cast({:accept_result, result}, %TaskAwaiter{state: awaiter_state, result_acceptor: result_acceptor, condition_verifier: condition_verifier, awaiter_notifier: awaiter_notifier} = state) do
    new_awaiter_state = awaiter_state |> result_acceptor.(result)
    if new_awaiter_state |> condition_verifier.() do
      awaiter_notifier.(new_awaiter_state)
    end
    {:noreply, %{state|state: new_awaiter_state}}
  end
end
