class LogParser
  attr_reader :filename

  def initialize(input)
    @filename = input
  end

  def parse
    count = 0
    header = /Started\s(?<request_type>[A-Z]+)\s(?<path>".+")\s(.+at\s)(?<time>.+(?=$))/
    File.open filename do |f|
      while not f.eof
        line = f.gets
        if header =~ line
          count += 1
        end
      end
    end
    count
  end
end

class Request
end
