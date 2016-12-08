require 'minitest/autorun'
require 'minitest/reporters'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
require_relative 'vigenere'

class VigenereTestProgram < Minitest::Test
  def setup
    @vigenere = Vigenere.new
  end

  def test_valid
    assert @vigenere.valid?('hello')
    refute @vigenere.valid?('h3ll0')
  end

  def test_make_key
    assert_equal [0, 1, 2, 3, 4, 5], @vigenere.make_key('ABCDEF')
  end

  def test_make_encrypted_ascii
    assert_equal [105, 102, 110, 109, 112], @vigenere.make_encrypted_ascii('hello', [1 , 1, 2])
    assert_equal [107, 105, 113, 114, 118], @vigenere.make_encrypted_ascii('hello', [3, 4, 5, 6, 7])
  end

  def test_encrypt
    assert_equal 'ifnmp', @vigenere.encrypt('hello', 'bbc')
    assert_equal 'aofbrfvsfocpgb', @vigenere.encrypt('zooarchaeology', 'barbados')
    assert_equal 'I_3mnp', @vigenere.encrypt('H_3llo', 'BBC')
  end
end
