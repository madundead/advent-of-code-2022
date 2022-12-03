INPUT = File.readlines('03/input.txt', chomp: true).map(&:chars)

PRIO = Hash[[*'a'..'z', *'A'..'Z'].zip([*1..52])]

INPUT.inject(0) do |acc, row|
  left, right = row.each_slice(row.size / 2).to_a
  acc + PRIO[(left & right).first]
end.then { puts _1 }

INPUT.each_slice(3).inject(0) do |acc, (first, second, third)|
  acc + PRIO[(first & second & third).first]
end.then { puts _1 }
