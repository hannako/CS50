module Finder

  def self.ruby_search(needle, hay)
    puts hay.include? needle
  end

  def self.linear_search(needle, hay)
    n       = hay.length
    result  = false
    (n - 1).times do |i|
      result = true if hay[i] == needle
    end
    puts result.to_s
  end



end

# first challenge: Finder expects a single command-line argument
# a "needle" to search for in a "haystack" of values.
# Prompt to provide some hay (i.e, integers) one "straw" at a time.

# needle = ARGV.first(&:to_i)
# hay = []
# loop do
#   puts 'hay?'
#   straw = STDIN.gets.chomp
#   hay << straw
#   break if straw == ''
# end
# Finder.linear_search(needle, hay)

# second challenge: Hay can be piped in from generate.rb
# via the command-line.
# Eg ruby p_sets/3/generate.rb 10 10| ruby p_sets/3/find.rb 21

needle = ARGV.first(&:to_i)

hay = STDIN.gets.split(' ')
puts "needle:" + needle.to_s
puts "hay:" + hay.to_s
Finder.linear_search(needle, hay)
