defmodule TaskAwaiter.Mixfile do
  use Mix.Project

  def project do
    [
      app: :task_awaiter,
      version: "0.1.1",
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
      {:ex_doc, "~> 0.14", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    [
      maintainers: ["Dmitry A Pyatkov"],
      links: %{"GitHub" => "https://github.com/dapdizzy/task_awaiter"},
      licenses: ["Apache 2.0"]
    ]
  end

  defp description do
    """
    A GenServer-ish implementation of an Awaiter.
    """
  end
end
