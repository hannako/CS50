# Implement sort so that the function sorts from smallest to largest
# the array of numbers that its passed,
# in such a way that its running time is in O(n2),
# where n is the arrays size.
# Odds are youll want to implement bubble sort,
# selection sort, or insertion sort.
# Just realize that theres no one "right" way to implement
# any of those algorithms; variations abound.
# In fact, youre welcome to improve upon them
# as you see fit, so long as your implementation
# remains in O(n2). However, take care not to alter
# our declaration of sort. Its prototype must remain:
# void sort(int values[], int n);

module Sorter

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
    puts array.to_s
  end
end

length = ARGV.first.to_i
array = STDIN.gets.split(" ").map(&:to_i)
puts "length:" + length.to_s
puts "array:" + array.to_s
Sorter.bubble_sort(array, length)
