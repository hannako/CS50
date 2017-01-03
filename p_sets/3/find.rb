module Finder
  def self.ruby_search(needle, hay)
    puts hay.include? needle
  end

  def self.linear_search(needle, hay)
    for i in 0..hay.length - 1
      if hay[i] == needle
        puts "true"
      else
        i += 1
      end
    end
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
# Finder.search(needle, hay)

# second challenge: Hay can be piped in from generate.rb
# via the command-line.
# Eg ruby p_sets/3/generate.rb 10 10| ruby p_sets/3/find.rb 21

needle = ARGV.first(&:to_i)

hay = STDIN.gets.split(' ')
puts "needle:" + needle.to_s
puts "hay:" + hay.to_s
Finder.linear_search(needle, hay)
