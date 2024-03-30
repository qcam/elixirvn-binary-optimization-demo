defmodule MyParser.PointerKeeping do
  def parse(binary) when is_binary(binary) do
    do_parse(binary, binary, {0, 0})
  end

  defp do_parse(<<char, rest::binary>>, original, {position, length})
       when char in ?0..?9 do
    do_parse(rest, original, {position, length + 1})
  end

  defp do_parse(<<_::binary>>, original, {position, length}) do
    binary_part(original, position, length)
  end
end
