class RandomArrayGenerator
  EXPONENT = 10**3
  attr_reader :length, :seed

  def initialize(length, seed = nil)
    @length = length
    srand(seed) if seed
  end

  def array
    Array.new(length) { (rand * EXPONENT).ceil }
  end

end

if ARGV.count > 2 || ARGV.count < 1
  raise "Error: Wrong number of arguments, expecting 1 or 2 "
else
  length, seed = ARGV.map(&:to_i)
  generate = RandomArrayGenerator.new(length, seed)
  puts generate.array.join " "
end
