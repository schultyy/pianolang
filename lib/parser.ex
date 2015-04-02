defmodule Pianolang.Parser do
  def parse(tokens) do
    Enum.reduce(tokens, {:scanning, []}, &parse/2)
    |> case(do: ({:result, result} -> result))
  end

  defp parse(:lparen, {:scanning, []}) do
    {:operator, []}
  end

  defp parse(:rparen, {:number, [operator | numbers]}) do
    op1 = List.first(numbers)
    op2 = List.last(numbers)
    case operator do
      :plus  -> {:result, op1 + op2 }
      :minus -> {:result, op1 - op2 }
      :mult  -> {:result, op1 * op2 }
      :div   -> {:result, op1 / op2 }
      _ -> {:error}
    end
  end

  defp parse(operator, {:operator, []}) do
    {:number, [operator]}
  end

  defp parse(number, {:number, acc}) do
    {:number, acc ++ [number]}
  end
end
