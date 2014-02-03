file = File.read("oliver.txt")

#assigns the text "oliver.txt" to the variable file as a string

non_keywords = %w[a an the of and A AN THE OF AND]

#returns array with all words as elements

words = file.scan(/\w+/)

#deletes all words from array if included in the non_keywords list

words.delete_if {|word| non_keywords.include? word}

word_count = {}

#Creates hash with word as key and number of occurences of word as value

words.each do |word|
  # word_count[word] = word_count[word] || 0
  word_cound[word].default = 0
  word_count[word] += 1
  # if word_count.has_key?(word)
  #   word_count[word] += 1
  # else
  #   word_count[word] = 1
  # end
end

#prints list of words with its word count
word_count.each {|word, count| puts "#{word}: #{count}"} 