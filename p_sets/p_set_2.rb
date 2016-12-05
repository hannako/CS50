# http://cdn.cs50.net/2016/x/psets/2/pset2/pset2.html

# INITIALIZING
# You may assume that the users input will contain only letters
# (uppercase and/or lowercase) plus single spaces between words.
def ask_name
  puts "What's your name?"
  gets.chomp
end

def initilize_name
  initials = ''
  ask_name.split.each do |word|
    initials += word.chr.upcase
  end
  initials
end

def initial_printer
  puts format('%s',initilize_name)
end

initial_printer
