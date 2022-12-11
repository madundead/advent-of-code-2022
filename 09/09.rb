INPUT = File.readlines('09/input.txt', chomp: true).map(&:split)

U = 'U'
R = 'R'
L = 'L'
D = 'D'

# def adjust(head, tail)
#   head_x, head_y = head
#   tail_x, tail_y = tail
#
#   hori_d = head_x - tail_x
#   vert_d = head_y - tail_y
#
#   case [hori_d, vert_d]
#   in [2, 0]
#     tail_x += 1
#   in [-2, 0]
#     tail_x -= 1
#   in [0, 2]
#     tail_y += 1
#   in [0, -2]
#     tail_y -= 1
#
#   in [2, 1]
#     tail_x += 1
#     tail_y += 1
#   in [2, -1]
#     tail_x += 1
#     tail_y -= 1
#   in [1, 2]
#     tail_x += 1
#     tail_y += 1
#   in [-1, 2]
#     tail_x -= 1
#     tail_y += 1
#
#   in [-2, 1]
#     tail_x -= 1
#     tail_y += 1
#   in [-2, -1]
#     tail_x -= 1
#     tail_y -= 1
#   in [1, -2]
#     tail_x += 1
#     tail_y -= 1
#   in [-1, -2]
#     tail_x -= 1
#     tail_y -= 1
#   else # nop
#     puts [hori_d, vert_d]
#   end
#
#   return [tail_x, tail_y]
# end

def adjacent?(head, tail)
  head_x, head_y = head
  tail_x, tail_y = tail

  (head_x - tail_x).abs <= 1 && (head_y - tail_y).abs <= 1
end

def adjust(head, tail)
  head_x, head_y = head
  tail_x, tail_y = tail

  hori_d = head_x - tail_x
  vert_d = head_y - tail_y

  if hori_d.abs >= 2
    tail_x += hori_d / hori_d.abs
    tail_y += vert_d / vert_d.abs if vert_d.abs > 0
  end

  if vert_d.abs >= 2
    tail_y += vert_d / vert_d.abs
    tail_x += hori_d / hori_d.abs if hori_d.abs > 0
  end

  [tail_x, tail_y]
end

rope10 = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
rope = [[0, 0], [0, 0]]

def simulate(rope)
  res = INPUT.inject({}) do |acc, (dir, moves)|
    moves.to_i.times do
      case dir
      when U
        rope[0][1] += 1
      when R
        rope[0][0] += 1
      when L
        rope[0][0] -= 1
      when D
        rope[0][1] -= 1
      end

      rope.each_with_index do |tail, idx|
        next if idx == 0 || adjacent?(rope[idx - 1], tail)

        rope[idx] = adjust(rope[idx - 1], tail)
      end

      acc[rope.last] = 1
    end

    acc
  end

  res.count
end

puts simulate(rope)
puts simulate(rope10)
