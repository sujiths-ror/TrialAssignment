json.status 200
json.message 'Success'
json.data do
  json.mappings do
    if @mappings
      json.array!(@mappings) do |mapping|
        json.id mapping.id
        json.name mapping.name
      end
    else
      json.mappings nil
    end
  end
end
