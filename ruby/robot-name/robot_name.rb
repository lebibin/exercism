class Robot

  attr_reader :name

  def initialize
    @name = random_name
  end

  def reset
    @name = random_name
  end

  def random_name
    letters = ('A'..'Z').to_a.sample(2)
    numbers = (0..9).to_a.sample(3)
    (letters + numbers).flatten.join
  end

end
