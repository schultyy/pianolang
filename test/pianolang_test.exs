defmodule PianolangTest do
  use ExUnit.Case

  test "process addition" do
    assert Pianolang.exec("(+ 1 2)") == 3
  end

  test "process subtraction" do
    assert Pianolang.exec("(- 5 2)") == 3
  end

  test "process multiplication" do
    assert Pianolang.exec("(* 3 4)") == 12
  end

  test "process division" do
    assert Pianolang.exec("(/ 8 2)") == 4
  end

  test "error on invalid operator" do
    assert Pianolang.exec("(% 8 2)") == {:error, "Illegal character %" }
  end
end
