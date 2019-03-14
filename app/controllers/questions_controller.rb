class QuestionsController < ApplicationController

  def import
    if request.post?
      file_path = save_file
      Question.delay.csv_import(file_path)
    end
  end

  private
  def save_file
    uploaded_io = params[:file]
    # Moving the file to some safe place; as tmp files will be flushed timely
    target = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(target, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    target
  end
end
