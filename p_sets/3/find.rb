class Find

  def search(needle, hay)
    hay.include? needle
  end

end

def main
  needle, *hay = ARGV.map(&:to_i)
  finder = Find.new
  # puts "needle: #{needle}"
  # puts "hay: #{hay}"
  puts finder.search(needle, hay)
end
main
