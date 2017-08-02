defmodule Example.TwoTest do
  use ExUnit.Case
  doctest Example.Two

  test "greets the world" do
    assert Example.Two.hello() == :world
  end

  # test "testing example 2" do
  #   assert "this is only a test" == Example.Two.do_something_two("this is only a test")
  # end
end
