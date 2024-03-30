defmodule MyParser.Original do
  def parse(binary) when is_binary(binary) do
    do_parse(next_integer(binary))
  end

  defp do_parse({char, rest}) do
    char <> do_parse(next_integer(rest))
  end

  defp do_parse(nil), do: <<>>

  defp next_integer(<<char, rest::binary>>) when char in ?0..?9, do: {<<char>>, rest}
  defp next_integer(<<_::binary>>), do: nil
end
