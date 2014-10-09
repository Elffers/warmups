#"market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce"

#{market: {name: "Cap Hill Market", description: "A good place to buy
#produce"}}

#"market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce&market[vendors_attributes][][name]=Jules%20Produce"

def params querystring
  params = {}
  pairs = querystring.split("&")
  pairs.each do |pairs|
    raw_key, value = pairs.split("=", 2) # this ensures splits only at first "="
    value.gsub!("%20", " ")

    #possibilites:
    # "key" => value is just a string
    # "key[]" => value is an array
    # "key[nkey]" => value is a hash, and nkey's value is a string
    # "key[nkey][]" => value is a hash, and nkey's value is an array
    # "key[nkey][][mkey]" => value is a hash, and nkey's value is an array of
    # hashes
    if /^\w+$/ =~ raw_key
      params[raw_key.to_sym] = value
    elsif /^(?<key>\w+)\[\]/ =~ raw_key
      key = key.to_sym
      if params.has_key? key
        params[key].push value
      else
        params[key] = [value]
      end
    elsif /(?<key>\w+)(\[(?<nested_key>\w+)\]$)/ =~ raw_key
      key = key.to_sym
      nested_key = nested_key.to_sym
      if params.has_key? key
        params[key][nested_key] = value
      else
        params[key] = {}
        params[key][nested_key] = value
      end
    elsif /(?<key>\w+)(\[(?<nested_key>\w+)\]\[\]$)/ =~ raw_key
      key = key.to_sym
      nested_key = nested_key.to_sym
      if params.has_key? key
        params[key][nested_key].push value
      else
        params[key] = {}
        params[key][nested_key] = [value]
      end

    end
  end
  p params
  params

end
