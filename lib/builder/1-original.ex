defmodule MyBuilder.Original do
  def build(tags) do
    Enum.reduce(tags, "", fn tag, acc ->
      acc <> build_tag(tag)
    end)
  end

  defp build_tag({name, content}) do
    "<#{name}>#{build_content(content)}</#{name}>"
  end

  defp build_content(content) when is_list(content) do
    build(content)
  end

  defp build_content(content) when is_binary(content) do
    content
  end
end
