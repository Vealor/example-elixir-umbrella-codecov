defmodule Example.ThreeTest do
  use ExUnit.Case
  doctest Example.Three

  test "greets the world" do
    assert Example.Three.hello() == :world
  end
end
