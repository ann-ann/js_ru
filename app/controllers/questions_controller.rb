class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :solve]
  before_action :create_tags_unless_exist, only: [:create]

  def index
    @questions = Question.search(params[:search]).page(params[:page])
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

  def create_tags_unless_exist
   if params[:tags_names]
      names = params[:tags_names].split(',')
      names.each { |n| Tag.create(name: n) unless Tag.find_by_name(n).present? }
    end
  end

  def solve
    @question.update(question_params)
    redirect_to @question
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text, :rating, :user_id, :tags_names, :is_solved, tag_ids: [])
    end
end
