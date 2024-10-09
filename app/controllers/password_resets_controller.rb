class PasswordResetsController < ApplicationController
  # skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      flash[:success] = 'パスワードリセットのメールを送信しました'
    else
      flash[:error] = 'メールアドレスが見つかりません'
    end
    redirect_to login_path
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
  
    if @user.blank?
      not_authenticated
      return
    end

  
    if @user.update(password: params[:user][:password])
      flash[:success] = 'パスワードがリセットされました'
      redirect_to login_path
    else
      render action: 'edit'
    end
  end
  
end
