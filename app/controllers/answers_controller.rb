class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :find_question, only: [:create, :update]


  def create
    @answer = current_user.answers.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to @question
    else
      flash[:error] = t action_name, scope: [:messages, :answers, :errors]
      redirect_to @question
    end
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to @question
    else
      flash[:error] = t action_name, scope: [:messages, :answers, :errors]
      redirect_to @question
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
    redirect_to answers_url
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def find_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:text, :rating, :user_id, :question_id)
    end
end
