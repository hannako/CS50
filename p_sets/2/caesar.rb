# HAIL CAESAR
# program that encrypts messages using Caesars cipher.
# program must accept a single command-line argument,k, a non-negative integer.
# Return 1 if the CLA doesnt meet these criteria
# Otherwise prompt the user for a string of plaintext and then output ciphertex.
# non-alphabetical characters should be outputted unchanged.
# After outputting this ciphertext, your program should exit, returning 0.
# you may not assume that k will be less than or equal to 26
#  should work for all non-negative ints less than 2v31 - 26
require_relative 'encryption'
class Caesar
  include Encryption

  def make_key(integer)
    integer % 26
  end

  def make_encrypted_ascii(plaintext, key)
    ascii = []
    plaintext.each_char do |character|
      if letter?(character)
        ascii << apply_key(character, key)
      else ascii << character
      end
    end
    ascii
  end

  def run
    integer = ARGV.first.to_i
    if integer > 0
      puts 'text?'
      plaintext = STDIN.gets.chomp
      cyphertext_reporter(plaintext, integer)
    else
      puts 1.to_s
    end
  end

end

Caesar.new.run
