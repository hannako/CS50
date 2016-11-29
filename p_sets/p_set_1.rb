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
MIN_HEIGHT = 0
MAX_HEIGHT = 23

def ask_height
  while true
    puts "height?"
    height = gets.chomp.to_i
    break if valid_input?(height)
  end
  height
end

def valid_input?(height)
  height <= MAX_HEIGHT && height > MIN_HEIGHT
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

#TIMEFORCHANGE
#assume that your program’s input will be 9.00 or just 9 but, again, not $9 or 900.

COINS = [100,20,10,5,2,1]

def ask_change
  while true
    puts "How much change is owed?"
    change = gets.chomp.to_f
    break if change > 0
  end
   return change
end

def calculate_coins(pence)
  n = COINS.count
  coins = []
  for n in 0..n-1
    denomination = COINS[n]
    quantity = pence / denomination
    pence -= (denomination * quantity)
    coins << quantity
  end
   coins.inject(:+)
end

def convert_to_pence(change)
  (change * 100).round
end

def change_reporter
  puts (calculate_coins convert_to_pence ask_change).to_s
end


bottle_reporter
mario
change_reporter
