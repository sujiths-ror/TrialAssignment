class QuestionsController < ApplicationController

  def import
    if request.post?
      Question.csv_import(params[:file])
    end
  end
end
