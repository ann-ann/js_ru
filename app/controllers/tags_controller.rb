class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy, :subscribe]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to tags_path
    else
      render action: 'new'
    end
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to @tags
    else
      render action: 'edit'
    end
  end

  def destroy
    @tag.destroy

    flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
    redirect_to tags_url
  end

  def subscribe
    @tag.subscibe_unsubscribe(@current_user)

    redirect_to tags_path
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
