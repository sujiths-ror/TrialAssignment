if @question.save
  json.status 200
  json.message 'Success'
  json.data do
    json.question @question
  end
else
  json.status 500
  json.message @question.errors.full_messages
  json.data {}
end
