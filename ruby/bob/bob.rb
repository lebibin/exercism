class Bob

  def hey(message)
    if /\A[^a-z]+[A-Z]+[^a-z]+\!?\z/ =~ message
      "Whoa, chill out!"
    elsif /\A.+\?\z/ =~ message
      "Sure."
    elsif /\A\s*\z/ =~ message
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

end
