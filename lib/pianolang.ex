defmodule Pianolang do
  def exec(program) do
    case lex(program) do
      {:success, tokens} -> parse(tokens)
      {:error, msg} -> {:error, msg}
    end
  end

  def parse(tokens) do
    case Pianolang.Parser.parse(tokens) do
      {:result, result} -> result
      {:state, result} ->  {:state, result}
    end
  end

  defp lex(program) do
    Pianolang.Lexer.tokens(program)
  end
end
