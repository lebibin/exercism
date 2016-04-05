class Acronym
  VERSION = 1.0
  WORD_REGEX = /([A-Z]?[a-z]+|[A-Z]+)\s*/
  NON_WORD_REGEX = /(\W|\A\z)/
  

  def self.abbreviate(word)
    "".tap do |acronym|
      split_into_words(word).each do |acronym_word|
        acronym << acronym_word[0]
      end
    end.upcase
  end

  private
  def self.split_into_words(word)
    word.split(WORD_REGEX).reject{|w| w =~ NON_WORD_REGEX }
  end
end
