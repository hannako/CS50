# http://cdn.cs50.net/2016/x/psets/2/pset2/pset2.html

# INITIALIZING
# You may assume that the users input will contain only letters
# (uppercase and/or lowercase) plus single spaces between words.
def ask_name
  puts "What's your name?"
  gets.chomp
end

def initialize_name(full_name)
  initials =
    full_name.split.map do |name|
    name.chr.upcase
    end
  initials.join('')
end

def initial_printer
  name = ask_name
  initials = initialize_name(name)
  puts initials
end

initial_printer
