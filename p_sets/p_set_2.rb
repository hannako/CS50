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
  puts initilize_name
end

initial_printer
