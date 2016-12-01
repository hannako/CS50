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
