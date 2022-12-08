INPUT = File.readlines('08/input.txt', chomp: true).map { _1.chars.map(&:to_i) }
INPUT_TRANSPOSED = INPUT.transpose

X = INPUT.first.size
Y = INPUT.size

c = 0

INPUT.each_with_index do |row, i|
  row.each_with_index do |height, j|
    left = row[0...j]
    right = row[j + 1...X]
    top = INPUT_TRANSPOSED[j][0...i]
    bottom = INPUT_TRANSPOSED[j][i + 1...Y]

    if [left, right, top, bottom].any?(&:empty?)
      c += 1
      next
    end

    if [left, right, top, bottom].any? { _1.max < height }
      c += 1
      next
    end
  end
end
puts c

res = []

INPUT.each_with_index do |row, i|
  row.each_with_index do |height, j|
    left = row[0...j].reverse
    right = row[j + 1...X]
    top = INPUT_TRANSPOSED[j][0...i].reverse
    bottom = INPUT_TRANSPOSED[j][i + 1...Y]

    a = left.inject(0) { |acc, x| break acc + 1 if x >= height; acc + 1 }
    b = right.inject(0) { |acc, x| break acc + 1 if x >= height; acc + 1 }
    c = top.inject(0) { |acc, x| break acc + 1 if x >= height; acc + 1 }
    d = bottom.inject(0) { |acc, x| break acc + 1 if x >= height; acc + 1 }

    res << [a,b,c,d].inject(&:*)
  end
end

puts res.max
