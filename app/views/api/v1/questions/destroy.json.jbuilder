if @question.blank?
  json.status 404
  json.message 'Question not found'
elsif @question.errors.any?
  json.status 500
  json.message @question.errors.full_messages
else
  json.status 200
  json.message 'Success'
end
