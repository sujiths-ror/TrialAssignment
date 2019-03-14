json.status 200
json.message 'Success'
json.data do
  json.questions do
    if @questions
      json.array!(@questions) do |question|
        json.merge! question.attributes
        json.updated_at question.updated_at
      end
    else
      json.questions nil
    end
  end
end
