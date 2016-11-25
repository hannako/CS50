# http://cdn.cs50.net/2016/x/psets/1/pset1/pset1.html
# SMART WATER
BOTTLE_VOLUME = 16
WATER_FLOW_RATE = 192
def bottle_reporter
  puts "That's #{bottle_calculator get_minutes} bottles of water"
end

def bottle_calculator(minutes)
  minutes * WATER_FLOW_RATE / BOTTLE_VOLUME
end

def get_minutes
  puts "How many minutes do you shower for?"
  minutes = gets.chomp.to_i
end

bottle_reporter
