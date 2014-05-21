class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to users_path
    else
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
      redirect_to @users
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy

    flash[:success] = t action_name, scope: [:messages, controller_name.to_sym]
    redirect_to users_url
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password_digest)
    end
end
