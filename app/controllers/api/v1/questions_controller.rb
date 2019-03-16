class Api::V1::QuestionsController < ApplicationController
  respond_to :json
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
    if @question.present?
      @question.destroy
      render json: {status: 200, data: {}, message: 'Question deleted'}
    else
      render json: {status: 404, data: {}, message: 'Question Not Found'}
    end
  end

  private
  def set_question
    @question = Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :priority, :teaming_stages, :appears, :question_type, :required, :conditions, :frequency, :role_id, :mapping_id)
  end
end

