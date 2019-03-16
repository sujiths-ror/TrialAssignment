if @question.blank?
  json.status 404
  json.message 'Question not found'
  json.data {}
elsif @question.errors.any?
  json.status 500
  json.message @question.errors.full_messages
  json.data {}
else
  json.status 200
  json.message 'Success'
  json.data do
    json.question @question
  end
end
