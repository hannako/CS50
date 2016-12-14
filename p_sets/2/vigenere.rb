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
require_relative 'encryption'
class Vigenere
  include Encryption
  attr_reader :key

  def self.valid_key(key)
    key.chars.map do |letter|
      letter.upcase.ord - ASCII_LETTERS[:capitals].min
    end
  end

  def initialize(key)
    @key = Vigenere.valid_key(key)
  end

  def apply_key(character, key, index)
    size = capital_letter?(character) ? :capitals : :lowercase
    ascii = character.ord + key[index].to_i
    ascii > ASCII_LETTERS[size].max ? ascii - 26 : ascii
  end

  def make_encrypted_ascii(plaintext)
    index = -1
    plaintext.chars.map do |character|
      if letter?(character)
        index = (index + 1) % key.length
        apply_key(character, key, index)
      else
        character
      end
    end
  end
end

def valid?(string)
  !/[^a-zA-Z]/.match(string)
end

def main
  key = ARGV.first
  if key.nil? || !ARGV.count == 1 || !valid?(key)
    exit 1
  else
    puts 'text?'
    plaintext = STDIN.gets.chomp
    cipher = Vigenere.new(key)
    puts cipher.encrypt(plaintext)
    exit 0
  end
end
main
