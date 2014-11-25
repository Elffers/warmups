require_relative 'log_parser'

describe LogParser do
  let(:sample) { "sample_log_small.txt"}
  let(:log_parser) { LogParser.new sample }
  context 'parses logfile' do
    it 'returns total number of requests' do
      expect(log_parser.parse).to eq ({"2014-10-23 08:37"=>1})
      large_log = LogParser.new "sample_log_large.txt"
      expect(large_log.parse).to eq ({"2014-10-23 08:37"=>22, "2014-10-23 08:38"=>978, "2014-10-23 08:59"=>63, "2014-10-23 09:00"=>117, "2014-10-23 09:01"=>20})
    end

  end
end
