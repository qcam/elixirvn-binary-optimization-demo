defmodule MyParser.MatchContextReuse do
  def parse(binary) when is_binary(binary) do
    do_parse(binary, "")
  end

  defp do_parse(<<char, rest::binary>>, acc) when char in ?0..?9 do
    do_parse(rest, acc <> <<char>>)
  end

  defp do_parse(<<_::binary>>, acc), do: acc
end
