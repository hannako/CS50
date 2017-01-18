module Collatz
  def self.steps(int, count = nil)
    count ||= 0
    return count if int == 1
    count += 1
    if int.even?
      steps(int / 2, count)
    else
      steps((3 * int + 1), count)
    end
  end
end
