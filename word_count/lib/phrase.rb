# Implement a Phrase Class here:
#
class Phrase
  attr_accessor :word_count

  def initialize(phrase)
    @word_count= {}
    words = phrase.scan(/\w+/)
    words.each do |word|
      word = word.downcase
      @word_count[word] = @word_count[word] || 0 #interesting that @word_count[word].default = 0 didn't work
      @word_count[word] += 1
    end
  end

end
