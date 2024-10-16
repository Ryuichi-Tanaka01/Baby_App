class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/page"
    else
      flash.now[:alert] = '入力エラーが発生しました'
      render :new
    end
  end

  def write_create
    user_id = current_user.id
    @record = Record.new(recorder_id: user_id)
  
    if @record.save
      redirect_to user_path(current_user.id)
    else
      render :write_create 
    end
  end
  

  def page
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    @records = Record.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
