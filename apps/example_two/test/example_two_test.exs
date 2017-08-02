defmodule Example.TwoTest do
  use ExUnit.Case
  doctest Example.Two

  test "greets the world" do
    assert Example.Two.hello() == :world
  end
end
