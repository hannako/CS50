module Collatz
  def self.steps(int, count = nil)
    count ||= 0
    return count if int == 1
    count += 1
    int.even? ? steps(int / 2, count) : steps((3 * int + 1), count)
  end
end
