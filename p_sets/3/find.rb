module Finder
  def self.linear_search(needle, hay)
    result = false
    hay.length.times do |i|
      if hay[i] == needle
        result = true
        break
      end
    end
    result
  end

  def self.binary_search_returning_value(needle, hay)
    max_point = hay.size - 1
    mid_point = (0 + max_point) / 2
    left_side = 0...mid_point
    right_side = (mid_point + 1)..max_point
    if needle < hay[0] || needle > hay[max_point]
      false
    else
      if needle < hay[mid_point]
        binary_search_returning_value(needle, hay[left_side])
      elsif needle > hay[mid_point]
        binary_search_returning_value(needle, hay[right_side])
      else
        hay[mid_point]
      end
    end
  end

  def self.binary_search_returning_index(needle, hay, start = 0, finish = nil)
    finish ||= hay.size - 1
    if needle < hay[start] || needle > hay[finish]
      false
    else
      mid_point = (start + finish) / 2
      if needle < hay[mid_point]
        binary_search_returning_index(needle, hay, start, mid_point - 1)
      elsif needle > hay[mid_point]
        binary_search_returning_index(needle, hay, mid_point + 1, finish)
      else
        mid_point
      end
    end
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
#
# needle = ARGV.first.to_i
# unsorted_hay = STDIN.gets.split(" ").map(&:to_i)
# sorted_hay = Finder.bubble_sort(unsorted_hay, unsorted_hay.length)
#
# puts "needle: " + needle.to_s
# puts "hay: " + sorted_hay.to_s
# print "present? "
# puts Finder.binary_search_returning_index(needle, sorted_hay)
# puts Finder.linear_search(needle, unsorted_hay)
