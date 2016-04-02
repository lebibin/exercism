class Acronym
  VERSION = 1.0

  def self.abbreviate(word)
    acronym = ""
    split = word.split(/([A-Z]?[a-z]+|[A-Z]+)\s*/).reject{|w| w =~ /\W/ || w.empty?}
    split.each do |w|
      acronym += w[0]
    end
    acronym.upcase
  end
end
