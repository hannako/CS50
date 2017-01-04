module Finder

  def self.linear_search(needle, hay)
    max_index   = hay.length - 1
    result      = false
    max_index.times do |i|
      result = true if hay[i] == needle
    end
    puts result.to_s
  end

  def self.binary_search(needle, hay)
    mid_point = (hay.length - 1) / 2
    max_point = hay.length - 1
    left_side = [0..mid_point]
    right_side = [(mid_point + 1)..max_point]

    if needle < hay[0] || needle > hay[max_point]
      result = false
    else
      if needle < hay[mid_point]
        binary_search(needle, hay[left_side])
      elsif needle > hay[mid_point]
        binary_search(needle, hay[right_side])
      else
        result = hay[mid_point]
      end
    end
    puts result.to_s
  end

  def self.bubble_sort(array, length)
    loop do
      switched = false

      (length - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          switched = true
        end
      end

      break unless switched
    end
    array
  end

end

needle = ARGV.first.to_i
unsorted_hay = STDIN.gets.split(" ").map(&:to_i)
sorted_hay = Finder.bubble_sort(unsorted_hay, unsorted_hay.length)

puts "needle: " + needle.to_s
puts "hay: " + sorted_hay.to_s
print "present? "
Finder.binary_search(needle, sorted_hay)
# Finder.linear_search(needle, unsorted_hay)
