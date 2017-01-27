require "minitest/autorun"
require "minitest/reporters"
require_relative "find"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class FindTest < Minitest::Test
  def test_linear_search
    assert_equal(true, Finder.linear_search(1, [1, 2, 3]))
    assert_equal(true, Finder.linear_search(3, [1, 2, 3]))
    assert_equal(false, Finder.linear_search(1, [-1, 0, 3]))
    assert_equal(true, Finder.linear_search(1, [1]))
  end

  def test_binary_search_returning_value
    assert_equal(1, Finder.binary_search_returning_value(1, [1, 2, 3, 4, 5, 6]))
    assert_equal(3, Finder.binary_search_returning_value(3, [1, 2, 3, 4, 5, 6]))
    assert_equal(6, Finder.binary_search_returning_value(6, [1, 2, 3, 4, 5, 6]))
    assert_equal(10, Finder.binary_search_returning_value(10, [10, 33, 45]))
    assert_equal(45, Finder.binary_search_returning_value(45, [10, 33, 45]))
    assert_equal(false, Finder.binary_search_returning_value(2, [10, 33, 45]))
  end

  def test_binary_search_returning_index
    assert_equal(0, Finder.binary_search_returning_index(1, [1, 2, 3, 4, 5, 6]))
    assert_equal(2, Finder.binary_search_returning_index(3, [1, 2, 3, 4, 5, 6]))
    assert_equal(5, Finder.binary_search_returning_index(6, [1, 2, 3, 4, 5, 6]))
    assert_equal(0, Finder.binary_search_returning_index(10, [10, 33, 45]))
    assert_equal(2, Finder.binary_search_returning_index(45, [10, 33, 45]))
    assert_equal(false, Finder.binary_search_returning_index(7, [1, 2, 3, 4, 5, 6]))
  end
end
