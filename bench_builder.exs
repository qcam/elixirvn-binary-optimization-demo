files = System.argv()

inputs = %{
  "flat" =>
    Enum.map(0..100_000, fn index ->
      {"name_#{index}", "pretty_long_content_#{index}"}
    end),
  "nested" =>
    Enum.reduce(1000..1, {"last", "content"}, fn index, acc ->
      {"element.#{index}", List.wrap(acc)}
    end)
    |> List.wrap()
}

bench_options = [
  print: [fast_warning: false],
  time: 2,
  memory_time: 2,
  inputs: inputs
]

parsers = %{
  "original" => &MyBuilder.Original.build/1,
  "iodata_to_binary" => &MyBuilder.IODataToBinary.build/1,
  "iodata" => &MyBuilder.IOData.build/1,
  "code_inline" => &MyBuilder.CodeInline.build/1
}

parsers = Map.take(parsers, ["original" | files])

Benchee.run(parsers, bench_options)
