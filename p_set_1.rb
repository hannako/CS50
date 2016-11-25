# http://cdn.cs50.net/2016/x/psets/1/pset1/pset1.html
# SMART WATER
BOTTLE_VOLUME = 16
WATER_FLOW_RATE = 192

def bottle_reporter
  puts "That's #{bottle_calculator ask_minutes} bottles of water"
end

def bottle_calculator(minutes)
  minutes * WATER_FLOW_RATE / BOTTLE_VOLUME
end

def ask_minutes
  puts "How many mins do you shower for?"
  minutes = gets.chomp.to_i
end

# ITSA MARIO
SPACE =      " "
BRICKS =     "#"
APEX_WIDTH = 2

def ask_height
  while true
    puts "height?"
    height = gets.chomp.to_i
    break if height < 24
  end
  height
end

def calculate_row_length(height)
  row_length = height + 1
end

def pyramid_printer(row_length)
  n = APEX_WIDTH
  for n in n..row_length
    puts SPACE * (row_length - n) + BRICKS * n
  end
end

def mario
  pyramid_printer calculate_row_length ask_height
end

bottle_reporter
mario
