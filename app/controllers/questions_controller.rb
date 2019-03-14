class QuestionsController < ApplicationController
  include Uploadable

  def import
    if request.post?
      if params[:file].present?
        file_path = save_file
        Question.delay.csv_import(file_path)
        flash[:success] = "Uploading started"
      else
        flash[:error] = "No file given"
      end
    end
  end
end
