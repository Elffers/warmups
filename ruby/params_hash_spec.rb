require_relative 'params_hash'

context 'params' do
  let(:querystring) { "market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce" }
  let(:querystring1) { "foo=bar&bar=baz" }
  let(:querystring2){"market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce&market[vendors_attributes][][name]=Jules%20Produce&market[vendors_attributes][][city]=Seattle"}
  let(:querystring3){"market[]=Cap%20Hill%20Market&market[]=Sunshine%20Produce"}
  let(:querystring4){"market[vendors][]=foo&market[vendors][]=Sunshine%20Produce"}

  #qs2 =  {:market=>{:name=>"Cap Hill Market",
  #            :description=>"A good place to buy produce",
  #            :vendors_attributes => [{name: "Jules Produce"}]
  #           }
  # }
  # qs3 = {:market => ["Cap Hill Market", "Sunshine Produce"]

  it 'parses simple k-v pairs and returns a hash' do
    params = params querystring1
    expect(params.keys).to eq [:foo, :bar]
    expect(params.values).to eq %w[bar baz]
  end

  it 'correctly parses array as value for a key' do
    params = params querystring3
    expect(params[:market]).to be_an_instance_of Array
    expect(params[:market]).to eq ["Cap Hill Market", "Sunshine Produce"]
  end

  it 'correctly parses nested hash' do
    params = params querystring
    expect(params[:market].keys).to eq [:name, :description]
    expect(params[:market][:name]).to eq "Cap Hill Market"
  end
  
  it 'parses array as value for key in nested hash' do
    params = params querystring4
    expect(params[:market][:vendors]).to be_an_instance_of Array
  end

  it 'parses array as value for key in nested hash' do
    params = params querystring2
    expect(params[:market][:vendors_attributes]).to be_an_instance_of Array
    expect(params[:market][:vendors_attributes].first).to be_an_instance_of Hash
    expect(params[:market][:vendors_attributes].first[:name]).to eq "Jules Produce"
  end
end
