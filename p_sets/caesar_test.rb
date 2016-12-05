require 'minitest/autorun'
require 'minitest/reporters'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
require_relative 'caesar'

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

  end
end
