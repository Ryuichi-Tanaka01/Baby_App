class SessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/users/page"
    else
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
