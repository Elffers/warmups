require_relative 'log_parser'

describe LogParser do
  let(:sample) { "sample_log_small.txt"}
  let(:log_parser) { LogParser.new sample }
  context 'parses logfile' do
    it 'returns total number of requests' do
      expect(log_parser.parse).to eq 1
      large_log = LogParser.new "sample_log_large.txt"
      expect(large_log.parse).to eq 1200
    end

  end
end

describe Request do
end
