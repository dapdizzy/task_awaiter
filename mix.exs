defmodule TaskAwaiter.Mixfile do
  use Mix.Project

  def project do
    [
      app: :task_awaiter,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      name: "TaskAwaiter",
      source_link: "https://github.com/dapdizzy/task_awaiter",
      package: package(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    maintainers: ["Dmitry A Pyatkov"],
    links: %{"GitHub" => "https://github.com/dapdizzy/task_awaiter"}
  end

  defp description do
    """
    A GenServer-ish implementation of an Awaiter.
    That is given some initial state (for tracking some task's progress),
    a condition verifier function (to determine whether we've reached the 'completion' state),
    a result acceptor function to add result of our task execution 'leg' to the overall progress,
    an awaiter notifier function accepting the final state (that has been verified by the condition verifier function) to notify the interested party (call a function basically) of the completion of a compound task.
    Basically, this is an 'accumulator' that 'waits' till the task is making its progress and invokes a callback function once the 'job is done'.
    We make use of the 'Erlang process mainbox' intrinsic mechanism as an efficient way of synchronization of many asynchronous tasks.
    """
  end
end
