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
  ASCII_CAPITALS = (65..90)
  ASCII_LOWERCASE = (97..122)
  ASCII_LETTERS = {
    capitals: ASCII_CAPITALS,
    lowercase: ASCII_LOWERCASE
  }

  def encrypt(plaintext, key)
    encrypted_ascii = convert_letters_to_ascii(plaintext, key)
    convert_ascii_to_text(encrypted_ascii)
  end

  def convert_letters_to_ascii(plaintext, key)
    ascii = []
    plaintext.chars.each do |character|
      if letter?(character)
        ascii << cipherize(character, key)
      else ascii << character
      end
    end
    return ascii
  end

  def cipherize(character, key)
    ascii = character.ord + key
    if capital_letter?(character)
      ascii > ASCII_CAPITALS.max ? ascii - 26 : ascii
    else
      ascii > ASCII_LOWERCASE.max ? ascii - 26 : ascii
    end
  end


  def convert_ascii_to_text(ascii)
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

end
