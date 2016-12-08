# Accept a single command-line argument: a keyword, k
# composed entirely of alphabetical characters.
# If your program is executed with 0, or more than 1 CLA,
# or if it contains any non-alphabetical chars exit and return 1.
# Treat A and a as 0, B and b as 1, and Z and z as 25.
# Only apply cipher to letters. Preserve the case.
# All other characters must be outputted unchanged.
# If your code is about to apply the jth character of k to
# a non-alphabetical character, you must wait to apply it
# to the next alphabetical character. Do not advance
# to the next character in k.

class Vigenere
  ASCII_LETTERS = {
    capitals: (65..90),
    lowercase: (97..122)
  }

  def cyphertext_reporter(plaintext, integer)
    puts format('%s', encrypt(plaintext, integer))
  end

  def encrypt(plaintext, string)
    key = make_key(string)
    encrypted_ascii = make_encrypted_ascii(plaintext, key)
    make_cyphertext(encrypted_ascii)
  end


  def make_key(string)
    key = []
    string.upcase.each_char do |letter|
      key << letter.ord - ASCII_LETTERS[:capitals].min
    end
    key
  end

  # HOOOOORRRRRRROOORRRRRR
  def make_encrypted_ascii(plaintext, key)
    ascii = []
    index = 0
    plaintext.each_char do |character|
      if letter?(character)
        ascii << apply_key(character, key, index)
        index < key.length - 1 ? index += 1 : index = 0
      else
        ascii << character
      end
    end
    ascii
  end

  def make_cyphertext(ascii)
    cyphertext = []
    ascii.each do |integer|
      cyphertext << integer.chr
    end
    cyphertext.join
  end

  def apply_key(character, key, index)
    capital_letter?(character) ? size = :capitals : size = :lowercase
    ascii = character.ord + key[index].to_i
    ascii > ASCII_LETTERS[size].max ? ascii - 26 : ascii
  end

  def letter?(character)
    capital_letter?(character) || lowercase_letter?(character)
  end

  def capital_letter?(character)
    ASCII_LETTERS[:capitals].cover?(character.ord)
  end

  def lowercase_letter?(character)
    ASCII_LETTERS[:lowercase].cover?(character.ord)
  end

  def valid?(string)
    (string == string.gsub(/[^a-zA-Z]/, ''))
  end

  def run
    string = ARGV.first
    if string.nil? || !ARGV.count == 1 || !valid?(string)
      puts 1.to_s
    else
      puts "text?"
      plaintext = STDIN.gets.chomp
      cyphertext_reporter(plaintext, string)
    end
  end

end

Vigenere.new.run
