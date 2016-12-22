# This program
# expects a single command-line argument:
# a "needle" to search for in a "haystack" of values.

# require_relative 'generate'

module Finder
  def self.search(needle, hay)
    puts hay.include? needle
  end
end

needle = ARGV.first(&:to_i)
hay = []
loop do
  puts 'hay?'
  straw = STDIN.gets.chomp
  hay << straw
  break if straw == ''
end
Finder.search(needle, hay)
