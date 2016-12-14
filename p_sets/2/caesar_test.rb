require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'caesar'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class CaesarProgramTest < Minitest::Test
  def setup
    @caesar = Caesar.new
  end

  def test_encrypt
    assert_equal  'fghi', @caesar.encrypt('abcd', 5),
                  'encryption method works for little letters'
    assert_equal  'BcB', @caesar.encrypt('AbA', 1),
                  'encryption method maintains case of letters'
    assert_equal  'Bc_-!@£$%^&*()B123', @caesar.encrypt('Ab_-!@£$%^&*()A123', 1),
                  'encryption ignores non-alphanumerics'
    assert_equal  'bcde', @caesar.encrypt('wxyz', 5),
                  'encryption works at end of alphabet'
    assert_equal  'B^^123e', @caesar.encrypt('W^^123z', 5),
                  'encryption works at end of alphabet'
    assert_equal 'abc', @caesar.encrypt('zab', 27),
                  'accepts integers greater than 26'

  end
end
