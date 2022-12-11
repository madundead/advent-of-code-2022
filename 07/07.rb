INPUT = File.readlines('07/input.txt', chomp: true)

# $res = []
#
# def traverse(dir = '/', prev_idx = 0)
#   cd_idx = INPUT[prev_idx...].find_index { _1.match(/^cd\ #{dir}/) }
#
#   dirs   = INPUT[prev_idx...][cd_idx + 1].gsub(/(dir \w+)+/).map { _1[4...] }
#   files  = INPUT[prev_idx...][cd_idx + 1].gsub(/\d+/).to_a
#
#   sum_files = files.map(&:to_i).sum
#   require 'pry'; binding.pry
#
#   $res << sum_files + dirs.map { traverse(_1, cd_idx + 1) }.sum
#
#   sum_files
# end

res = Hash.new(0)

INPUT.each_with_object([]) do |row, arr|
  case row
  when /^\d+/
    arr.inject('') do |acc, dir|
      path = acc + dir
      res[path] += row.to_i
      path
    end
  when /cd \.\./
    arr.pop
  when /cd \S+/
    arr << row.split.last
  end
  # require 'pry'; binding.pry
end

pp res.values.select { _1 <= 100_000 }.sum 
pp res.values.reject { _1 < res['/'] - 40_000_000 }.min

# traverse
# pp $res
# pp $res.select { _1 <= 100_000 }.sum
# {"hdh"=>267125,
#  "hgrpfmt"=>319727,
#  "sjgvbd"=>27997,
#  "cmjgvh"=>1105372,
#  "nglsj"=>593907,
#  "szs"=>100303,
#  "cmh"=>770985,
#  "czrzl"=>688546,
#  "fcbt"=>150417,
#  "jgrdd"=>325202,
#  "grncq"=>366901,
#  "lqblqtng"=>1379229,
#  "pgvmpmn"=>18511,
#  "pqqcvcm"=>502736,
#  "mbrcgcd"=>100317,
#  "ddd"=>467218,
#  "dpnghvpp"=>526430,
#  "brhmv"=>1114111,
#  "twnj"=>291536,
#  "mhnfrn"=>321786,
#  "zglbptq"=>1686998,
#  "/"=>4173091}
