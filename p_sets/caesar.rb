# HAIL CAESAR
# program that encrypts messages using Caesars cipher.
# program must accept a single command-line argument,k, a non-negative integer.
# Return 1 if the CLA doesnt meet these criteria
# Otherwise prompt the user for a string of plaintext and then output ciphertex.
# non-alphabetical characters should be outputted unchanged.
# After outputting this ciphertext, your program should exit, returning 0.
# you may not assume that k will be less than or equal to 26
#  should work for all non-negative ints less than 2v31 - 26
class Caesar
  ASCII_LETTERS = {
    capitals: (65..90),
    lowercase: (97..122)
  }

  def cyphertext_reporter(plaintext, integer)
    puts format('%s', encrypt(plaintext, integer))
  end

  def encrypt(plaintext, integer)
    key = make_key(integer)
    encrypted_ascii = make_encrypted_ascii(plaintext, key)
    make_cyphertext(encrypted_ascii)
  end

  def make_encrypted_ascii(plaintext, key)
    ascii = []
    plaintext.chars.each do |character|
      if letter?(character)
        ascii << apply_key(character, key)
      else ascii << character
      end
    end
    ascii
  end

  def apply_key(character, key)
    capital_letter?(character) ? size = :capitals : size = :lowercase
    ascii = character.ord + key
    ascii > ASCII_LETTERS[size].max ? ascii - 26 : ascii
  end

  def make_cyphertext(ascii)
    cyphertext = []
    ascii.each do |integer|
      cyphertext << integer.chr
    end
    cyphertext.join
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

  def make_key(integer)
    integer % 26
  end

  def run
    integer = ARGV.first.to_i
    if integer > 0
      puts "text?"
      plaintext = STDIN.gets.chomp
      cyphertext_reporter(plaintext, integer)
    else
      puts '1'
    end
  end

end

Caesar.new.run
