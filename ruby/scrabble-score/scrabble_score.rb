class Scrabble
  attr_reader :score

  SCORE_TABLE = {
    1   => %w{A E I O U L N R S T},
    2   => %w{D G},
    3   => %w{B C M P},
    4   => %w{F H V W Y},
    5   => %w{K},
    8   => %w{J X},
    10  => %w{Q Z}
  }

  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @score = score_for(word)
  end

  def score_for word
    total_score = 0

    return total_score if word.nil?

    word.split('').each do |letter|
      SCORE_TABLE.each do |score, letters|
        total_score += score if letters.include?(letter.upcase)
      end
    end

    total_score

  end
end
