class SessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/users/page"
    else
      flash.now[:alert] = '入力された内容が正しくありません'
      render :new
    end
  end
  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
  def newpassword
  end
end
