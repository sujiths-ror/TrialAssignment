class Api::V1::QuestionsController < ApplicationController

  before_action :set_question, only: %i(show edit update destroy)

  def create
    @question = Question.new(question_params)
  end

  def index
     @questions = Question.all.page(params[:page] || 1).per(10)
  end

  def show; end

  def edit; end

  def update
    @question.update(question_params) if @question.present?
  end

  def destroy
    @question.destroy if @question.present?
  end

  private
  def set_question
    @question = Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :priority, :teaming_stages, :appears, :question_type, :required, :conditions, :frequency, :role_id, :mapping_id)
  end
end

