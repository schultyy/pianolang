defmodule Pianolang do
  def exec(program) do
    lex(program) |> Pianolang.Parser.parse
  end

  defp lex(program) do
    Pianolang.Lexer.tokens(program)
  end
end
