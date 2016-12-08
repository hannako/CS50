module Encryption

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
end
