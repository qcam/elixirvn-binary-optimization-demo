defmodule MyBuilder.IODataToBinary do
  def build(tags) do
    build_tags(tags, "")
  end

  defp build_tags([], acc), do: IO.iodata_to_binary(acc)

  defp build_tags([tag | tags], acc) do
    acc = [acc | build_tag(tag)]
    build_tags(tags, acc)
  end

  defp build_tag({name, content}) do
    [?<, name, ?>, build_content(content), ?<, ?/, name, ?>]
  end

  defp build_content(content) when is_list(content) do
    build(content)
  end

  defp build_content(content) when is_binary(content) do
    content
  end
end
