defmodule Pianolang.Lexer do
  def tokens(program) do
    tokenize([], String.graphemes(program))
  end

  defp tokenize(tokens, []) do
    { :success, tokens }
  end

  defp tokenize(tokens, [char | graphemes]) do
    cond do
      is_number?(char) -> tokenize(tokens ++ [String.to_integer(char)], graphemes)
      char == "(" -> tokenize(tokens ++ [:lparen], graphemes)
      char == ")" -> tokenize(tokens ++ [:rparen], graphemes)
      char == "+" -> tokenize(tokens ++ [:plus], graphemes)
      char == "-" -> tokenize(tokens ++ [:minus], graphemes)
      char == "*" -> tokenize(tokens ++ [:mult], graphemes)
      char == "/" -> tokenize(tokens ++ [:div], graphemes)
      is_whitespace?(char) -> tokenize(tokens, graphemes)
      true -> {:error, "Illegal character #{char}"}
    end
  end

  defp is_whitespace?(str) do
    Regex.match?(~r/\s/, str)
  end

  defp is_number?(str) do
    case Integer.parse(str) do
      :error -> false
      _ -> true
    end
  end
end
