json.status 200
json.message 'Success'
json.data do
  json.roles do
    if @roles
      json.array!(@roles) do |role|
        json.id role.id
        json.name role.name
      end
    else
      json.roles nil
    end
  end
end
