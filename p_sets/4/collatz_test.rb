require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'collatz'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class CollatzTest < Minitest::Test

  def test_steps_works_for_1
    assert_equal(0, Collatz.steps(1))
  end

  def test_steps_works_for_evens
    assert_equal(1, Collatz.steps(2))
    assert_equal(2, Collatz.steps(4))
    assert_equal(8, Collatz.steps(6))
    assert_equal(3, Collatz.steps(8))
    assert_equal(24, Collatz.steps(50))
  end

  def test_steps_works_for_odds
    assert_equal(7, Collatz.steps(3))
    assert_equal(5, Collatz.steps(5))
    assert_equal(16, Collatz.steps(7))
    assert_equal(17, Collatz.steps(15))
    assert_equal(111, Collatz.steps(27))
  end


end
