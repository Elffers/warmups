# Give me the average annual income per decade of birth

def year_salary_array_regex(lines)
  data_re = %r{\w+ \w+, (\d\d\d\d)/\d\d\/\d\d, (\d+.\d\d)}

  lines.map do |l|
    match = data_re.match(l)
    match.captures if match
  end
end

def year_salary_array_no_regex(lines)
  lines.map do |l|
    fields = l.split(",")
    if fields.size == 3
      name, birthdate, salary = fields
      date_fields = birthdate.split("/")
      if date_fields.size == 3
        year, month, day = date_fields
        [year.strip, salary.strip]
      end
    end
  end
end

data = File.readlines("text.txt")

year_salary_arrays =  [year_salary_array_no_regex(data),
                       year_salary_array_regex(data)]

year_salary_arrays.each do |year_salary_array|

  decade_to_salaries = Hash.new { [] }
  year_salary_array.compact.each do |year, salary|
    decade_to_salaries[year.chop + "0"] <<= Float(salary)
  end

  decade_to_salaries.each do |decade, salaries|
    avg = salaries.reduce(:+) / Float(salaries.size)
    puts "Avg salary in #{decade}s is $#{avg}"
  end
end
