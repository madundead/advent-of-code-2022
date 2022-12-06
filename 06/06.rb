INPUT = File.read('06/input.txt').chars[...-1]

RES = lambda do |n|
  INPUT.each_with_index.inject(0) do |_, (_, idx)|
    next 0 if idx < n

    indices = (n - 1).times.with_object([idx]) { |_, i| i << i.last - 1 }.reverse
    arr = INPUT.values_at(*indices)

    next 0 unless arr.uniq.size == n

    break idx + 1
  end
end

puts RES.call(4)
puts RES.call(14)

# After r/adventofcode:
# I forgot about #each_cons
