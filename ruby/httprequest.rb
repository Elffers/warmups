  # Create a class: 
  # 1. The `new` method takes the path to a HTTP request file. 
  # 2. Parses out the following data into attributes: 
      # - request type (POST) 
      # - request path ('/home') 
      # - Referer 
      # - format (Content-Type) 
      # - Time stamp 
      # - Data as key: values ({:username => "zurfyx", ...}) 
  # 3. Determines whether an HTML file exists with the same name as the path (home.html). 
  # 4. If a file does (you would need to create that file), an `html` method that serve back the HTML within the file. 
  # This would be a script or something you'd run in the console. 
  # This will give you more ruby, regex, and knowledge of an HTTP request (help understanding Rails)

  class HTTPRequest
    attr_accessor :request, :path, :referer, :format, :time, :params

    def initialize(filename) #could pass in contents of the file as argument, which would obviate next line
      @contents   = File.read(filename)
      @request    = @contents.match(/GET|POST|PATCH|DELETE/)[0]
      @path       = @contents.scan(/^http.+/).first.scan(/\/[a-z]+/).first
      @referer    = @contents.scan(/^Referer.+/).first.scan(/http.+/).first
      @format     = @contents.scan(/^Content-Type.+/).map {|type| type.partition(/: /).last}
      @time       = @contents.scan(/^Date.+/).first.partition(/: /).last
      @params     = params_hash
    end

    # def self.all
    #   Dir.glob("/*.txt").each do |file|
    #     Foo.new(File.read(file))
    #   end
    # end

    def params_hash
      hash = {}
      @contents.scan(/^.+/).each do |data|
        data_partition = data.partition(/: /)
        if data.partition(/: /).last == ""
          next
        else 
          hash[data.partition(/: /).first] = data.partition(/: /).last
        end
      end
      hash
    end

    def html
      file = Dir.glob("*.html") #returns hash containing filenames of any file that matches the argument
      File.read(file.first) #this seems hacky
    end

  end #end class

  x = HTTPRequest.new("httprequest.txt")

