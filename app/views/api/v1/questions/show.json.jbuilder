if @question.blank?
  json.status 404
  json.message 'Question not found'
  json.data {}
else
  json.status 200
  json.message 'Success'
  json.data do
    json.question @question
  end
end
