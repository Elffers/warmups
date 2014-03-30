# Given a data file with unspecified number of headers and footers and followed by
# data lines which consist of the person's name, birthday, and income in the form
# firstname lastname, YYYY/MM/DD, dddddd.cc (i.e. Kai Jones, 1982/10/23, 350.00)
# Give me the average annual income per decade of birth

class Foo 
  attr_accessor :text, :data, :names, :birthdays, :incomes, :income_by_birthday

  def initialize(text)
    @text       = File.readlines(text)
    @data       = data
    @names      = names
    @birthdays  = birthdays
    @incomes    = incomes
    @income_by_birthday = income_by_birthday
  end

  def data
    matches = @text.map {|line| line.strip.match(/\w+\s\w+,\s\d+\/\d+\/\d+,\s\d+\.\d+/)}.compact
    @data   = matches.map {|match| match.to_s }
  end

  def names
    @names = @data.map do |line|
      line.match(/\w+\s\w+/).to_s
    end
  end

  def birthdays
    @birthdays = @data.map do |line|
      line.match(/\d+\/\d+\/\d+/).to_s
    end
  end

  def incomes
    @incomes = @data.map do |line|
      line.match(/\d+\.\d+/).to_s.to_f
    end
  end

  def income_by_birthday
    @data.map {|line| line.match(/\d+\/\d+\/\d+,\s\d+\.\d+/).to_s}
  end

  def group_by_decade
    @income_by_birthday.group_by {|x| x.scan(/\d\d(\d)\d/).flatten}
  end

  def income_by_decade
    group_by_decade.values.map do |value|
      value.map do |string|
        string.match(/\d+\.\d+/).to_s.to_f
      end
    end
  end
  
  def average_income
    income_by_decade.map do |array|
      array.inject(0){|sum, x| sum += x}/array.length
    end
  end

 def decade_average
   group_by_decade.keys.flatten.zip(average_income)
 end

 def output
  decade_average.each do |x|
    puts "In the 19#{x.first}0's, the average income was #{x.last}"
  end
 end

end #end class


f = Foo.new('text.txt')


#### Solution 1 ###

#returns array containing strings of each line of text
data = File.readlines("text.txt")

#returns array of arrays "arrays". Each array within 'arrays' contains 3 string elements: name, date, income
arrays = data.map do |x|
  x.chop.split(",")
end

# returns array or arrays with birth years converted to Fixnums (.to_i gets rid of everything after /)
arrays.map do |x|
  x[1] = x[1].to_i
  x[2] = x.last.to_f
end

#sorts entries in 'arrays' by birth year
sort_by_year = arrays.sort_by {|x| x[1]}

#returns hash with decade as key and array of matching entries as value
group_by_decade = arrays.group_by {|x| x[1].to_s[2]}

#Returns average income by key
group_by_decade.each do |key, value|
  if key == nil
    next
  else
   puts "In the decade 19#{key}0, the average income is #{(value.inject(0){|sum, x| sum + x.last})/value.length}"
  end
end

#Knipbak
# returns array of birthyears as strings
arrays.map do |x|
  date = x[1]
  date.scan(/\d+/).first
end



