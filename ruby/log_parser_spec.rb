require_relative 'log_parser'

describe LogParser do
  let(:sample1) { "sample_log_small.txt"}
  let(:log_parser_small) { LogParser.new sample1 }
  let(:sample2) { "sample_log_large.txt"}
  let(:log_parser_large) { LogParser.new sample2 }

  context 'parses logfile' do
    it 'returns total number of requests' do
      expect(log_parser_small.parse).to eq ({"2014-10-23 08:37"=>{"/posts/new"=>1}})
      expect(log_parser_large.parse).to eq ({"2014-10-23 08:37"=>{"/posts/new"=>10, "/posts"=>6, "/posts/9/edit"=>3, "/"=>3}, "2014-10-23 08:38"=>{"/posts/9/edit"=>234, "/"=>222, "/posts"=>250, "/posts/new"=>272}, "2014-10-23 08:59"=>{"/"=>17, "/posts/new"=>14, "/posts/9/edit"=>17, "/posts"=>15}, "2014-10-23 09:00"=>{"/"=>32, "/posts/new"=>30, "/posts/9/edit"=>31, "/posts"=>24}, "2014-10-23 09:01"=>{"/posts/new"=>5, "/posts/9/edit"=>5, "/"=>4, "/posts"=>6}})
    end
  end
end
