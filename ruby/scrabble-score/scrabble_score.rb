class Scrabble
  attr_reader :score

  BASE_SCORE = 0
  SCORE_TABLE = {
    1   => %w{A E I O U L N R S T},
    2   => %w{D G},
    3   => %w{B C M P},
    4   => %w{F H V W Y},
    5   => %w{K},
    8   => %w{J X},
    10  => %w{Q Z}
  }.freeze

  def initialize(word)
    @score = score_for(word)
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private
  def score_for word
    return BASE_SCORE if word.nil?

    word.split('').inject(BASE_SCORE) do |sum, letter|
      SCORE_TABLE.each do |score, letters|
        sum += score if letters.include?(letter.upcase)
      end
      sum
    end
  end
end
