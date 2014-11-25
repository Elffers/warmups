require 'time'

class LogParser
  attr_reader :filename

  def initialize(input)
    @filename = input
  end

  def parse
    request_counter = Hash.new 0 
    File.open filename do |f|
      while not f.eof
        line = f.gets
        if /Started\s(?<request_type>[A-Z]+)\s(?<path>".+")\s(.+at\s)(?<timestamp>\d{4}-\d{2}-\d{2}\s\d{2}:\d{2})/=~ line
          request_counter[timestamp] += 1
        end
      end
    end
    request_counter
  end
end
