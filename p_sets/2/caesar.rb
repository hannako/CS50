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
  attr_reader :key

  def self.valid_key(key)
    key % 26
  end

  def initialize(key)
    @key = Caesar.valid_key(key)
  end

  def make_encrypted_ascii(plaintext)
    plaintext.chars.map do |character|
      if letter?(character)
        apply_key(character, key)
      else
        character
      end
    end
  end
end

def main
  key = ARGV.first.to_i

  if key > 0
    puts 'text?'
    plaintext = STDIN.gets.chomp
    cipher = Caesar.new(key)
    puts cipher.encrypt(plaintext)
    exit 0
  else
    exit 1
  end
end

main
