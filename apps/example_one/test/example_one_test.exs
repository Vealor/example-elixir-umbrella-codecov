defmodule Example.OneTest do
  use ExUnit.Case
  doctest Example.One

  test "greets the world" do
    assert Example.One.hello() == :world
  end

  test "testing example 1" do
    assert "this is only a test" == Example.One.do_something_one("this is only a test")
  end
end
