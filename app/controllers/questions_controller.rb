class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
   current_user.views.create(question: @question) unless current_user.already_viewed?(@question)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to questions_path
    else
      render action: 'new'
    end
  end

  def update
    if @question.update(question_params)
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to @question
    else
      render action: 'edit'
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_url
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text, :rating, :user_id, tag_ids: [])
    end
end
