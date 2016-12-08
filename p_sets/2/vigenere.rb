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

  def make_key(string)
    key = []
    string.upcase.each_char do |letter|
      key << letter.ord - ASCII_LETTERS[:capitals].min
    end
    key
  end

  def apply_key(character, key, index)
    capital_letter?(character) ? size = :capitals : size = :lowercase
    ascii = character.ord + key[index].to_i
    ascii > ASCII_LETTERS[size].max ? ascii - 26 : ascii
  end

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

  def valid?(string)
    string.index(/[^a-zA-Z]/).nil?
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
