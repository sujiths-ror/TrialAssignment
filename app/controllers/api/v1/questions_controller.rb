class Api::V1::QuestionsController < ApplicationController

  before_action :set_question, only: %i(show edit)

  def index
     @questions = Question.all.page(params[:page] || 1).per(10)
  end

  def show; end

  def edit; end

  private
  def set_question
    @question = Question.find_by(id: params[:id])
  end
end
