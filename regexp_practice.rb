# data file, unspecified number of headers and footers followed by
# data lines which consist of the person's name, birthday, and income in the form
# firstname lastname, YYYY/MM/DD, dddddd.cc

# Give me the average annual income per decade of birth


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


#Knipbak
# returns array of birthyears as strings
arrays.map do |x|
  date = x[1]
  date.scan(/\d+/).first
end

