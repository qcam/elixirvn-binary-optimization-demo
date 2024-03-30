files = System.argv()

inputs = %{
  "long" => String.duplicate("1234567890", 10000),
  "short" => "1234567890"
}

bench_options = [
  print: [fast_warning: false],
  time: 2,
  memory_time: 2,
  inputs: inputs
]

parsers = %{
  "original" => &MyParser.Original.parse/1,
  "match_context_reuse" => &MyParser.MatchContextReuse.parse/1,
  "pointer_keeping" => &MyParser.PointerKeeping.parse/1,
  "bits_syntax" => &MyParser.BitSyntax.parse/1,
  "code_inline" => &MyParser.CodeInline.parse/1
}

parsers = Map.take(parsers, ["original" | files])

Benchee.run(parsers, bench_options)
