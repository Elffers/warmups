class String

  def camel_to_snake
    words = self.scan(/[A-Z][a-z]+/)
    lower = words.map {|x| x.downcase}
    lower.join("_")
  end

  def snake_to_camel
    words = self.split("_")
    upper = words.map {|x| x.capitalize}
    upper.join("")
  end

end

