require_relative 'params_hash'

context 'params' do
  let(:querystring) { "market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce" }
  let(:querystring1) { "foo=bar&bar=baz" }
  let(:querystring2){"market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce&market[vendors_attributes][][name]=Jules%20Produce"}
  let(:querystring3){"market[]=Cap%20Hill%20Market&market[]=Sunshine%20Produce"}

  #qs2 =  {:market=>{:name=>"Cap Hill Market",
  #            :description=>"A good place to buy produce",
  #            :vendors_attributes => [{name: "Jules Produce"}]
  #           }
  # }
  # qs3 = {:market => ["Cap Hill Market", "Sunshine Produce"]

  it 'returns a hash' do
    expect(params(querystring1).keys).to eq [:foo, :bar]
    expect(params(querystring1).values).to eq %w[bar baz]
    expect(params(querystring)[:market].keys).to eq [:name, :description]
  end

  it 'correctly parses array as value for a key' do
    #expect(params(querystring2)[:market][:vendors_attributes]).to be_an_instance_of Array
    expect(params(querystring3)[:market]).to be_an_instance_of Array
  end
end
