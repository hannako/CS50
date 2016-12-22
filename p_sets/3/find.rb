module Finder
  def self.search(needle, hay)
    puts hay.include? needle
  end
end

# The following code addresses the first step of the task,
# i.e. Finder expects a single command-line argument
# a "needle" to search for in a "haystack" of values.
# You’ll be prompted to provide some hay (i.e., some integers),
# one "straw" at a time. As soon as you tire of providing integers,
# hit ctrl-d to send the program an EOF(end-of-file) character.

# needle = ARGV.first(&:to_i)
# hay = []
# loop do
#   puts 'hay?'
#   straw = STDIN.gets.chomp
#   hay << straw
#   break if straw == ''
# end
# Finder.search(needle, hay)

needle = ARGV.first(&:to_i)
hay = STDIN.gets
puts "needle: #{needle}"
puts "hay: #{hay}"
Finder.search(needle, hay)
