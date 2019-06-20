class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      @organizer = nil
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:member_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @member = Member.find_by(email: email)
    if @member && @member.authenticate(password)
      # ログイン成功
      session[:member_id] = @member.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
