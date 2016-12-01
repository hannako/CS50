# http://cdn.cs50.net/2016/x/psets/1/pset1/pset1.html
# SMART WATER
BOTTLE_VOLUME = 16
WATER_FLOW_RATE = 192

def bottle_reporter
  shower_length = ask_minutes
  bottles = bottle_calculator(shower_length)
  puts format("That's %i bottles of water", bottles)
end

def bottle_calculator(minutes)
  minutes * WATER_FLOW_RATE / BOTTLE_VOLUME
end

def ask_minutes
  puts "How many mins do you shower for?"
  minutes = gets.chomp.to_i
end

# ITSA MARIO
SPACE         =  " "
BRICK         =  "#"
APEX_WIDTH    =  2
MIN_HEIGHT    =  0
MAX_HEIGHT    =  23
VALID_HEIGHTS =  MIN_HEIGHT..MAX_HEIGHT

def ask_height
  while true
    puts "height?"
    height = gets.chomp.to_i
    break if valid_input?(height)
  end
  height
end

def valid_input?(height)
  VALID_HEIGHTS.include? height
end

def calculate_row_length(height)
  row_length = height + 1
end

def pyramid_printer(row_length)
  APEX_WIDTH.upto(row_length) do |bricks_in_row|
    puts SPACE * ( row_length - bricks_in_row ) + BRICK * bricks_in_row
  end
end

def mario
  height = ask_height
  row_length = calculate_row_length(height)
  pyramid_printer(row_length)
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
  COINS.each do |denomination|
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
