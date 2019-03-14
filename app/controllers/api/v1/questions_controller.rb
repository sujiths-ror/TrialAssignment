class Api::V1::QuestionsController < ApplicationController

  before_action :set_question, only: %i(show)

  def index
     @questions = Question.all
  end

  def show; end

  private
  def set_question
    @question = Question.find_by(id: params[:id])
  end
end
