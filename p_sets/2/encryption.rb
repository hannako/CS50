module Encryption
  ASCII_LETTERS.freeze = {
    capitals: (65..90),
    lowercase: (97..122)
  }

  def cyphertext_reporter(plaintext, key)
    puts encrypt(plaintext, key)
  end

  def encrypt(plaintext)
    encrypted_ascii = make_encrypted_ascii(plaintext)
    make_cyphertext(encrypted_ascii)
  end

  def apply_key(character, key)
    size = capital_letter?(character) ? :capitals : :lowercase
    ascii = key + character.ord
    ((ascii - ASCII_LETTERS[size].min) % 26) + ASCII_LETTERS[size].min
  end

  def make_cyphertext(ascii)
    ascii.map(&:chr).join
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
