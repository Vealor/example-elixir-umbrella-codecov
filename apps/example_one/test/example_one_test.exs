defmodule Example.OneTest do
  use ExUnit.Case
  doctest Example.One

  test "greets the world" do
    assert Example.One.hello() == :world
  end
end
