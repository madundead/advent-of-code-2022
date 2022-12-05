INPUT = File.read('05/input.txt').split(/\n\n/).map { _1.split(/\n/) }

STACK = INPUT.first
MOVES = INPUT.last.map { _1.gsub(/\d+/).to_a.map(&:to_i) }

INDICES = (STACK[-1].gsub(/\d/).to_a.size - 1).times.with_object([1]) { |_, i| i << i.last + 4 }

CRATES = lambda do
  STACK[...-1]
    .map { _1.chars.values_at(*INDICES) }
    .transpose.map { _1.reject { |v| v == ' ' } }
end

crates1 = CRATES.call
crates2 = CRATES.call

MOVES.each { |m| m[0].times { crates1[m[2] - 1].unshift(crates1[m[1] - 1].shift) } }
     .then { puts crates1.map(&:first).join }

MOVES.each { |m| crates2[m[2] - 1].unshift(*crates2[m[1] - 1].shift(m[0])) }
     .then { puts crates2.map(&:first).join }
