defmodule TaskAwaiterTest do
  use ExUnit.Case
  doctest TaskAwaiter

  test "greets the world" do
    assert TaskAwaiter.hello() == :world
  end
end
