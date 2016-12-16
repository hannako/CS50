class RandomArrayGenerator
  EXPONENT = 10**3
  attr_reader :length, :seed

  def initialize(length, seed = nil)
    @length = length
    @seed = seed
  end

  def array
    Array.new(length) { (rand * EXPONENT).ceil }
  end

  def seed_rand
    srand seed
  end
end

def main
  if ARGV.count > 2 || ARGV.empty?
    exit 1
  else
    length, *seed = ARGV.map(&:to_i)
    generate = RandomArrayGenerator.new(length, seed.first)
    unless seed.empty? then generate.seed_rand
    end
    generate.array
  end
end

main
