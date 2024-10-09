class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts params.inspect
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/page"
    else
      puts @user.errors.full_messages
      render :new
    end
  end

  def write_crete
    user_id = current_user.id
    @record = Record.new
  end

  def page
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @user = User.find_by(id: params[:id])
    @record = Record.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
