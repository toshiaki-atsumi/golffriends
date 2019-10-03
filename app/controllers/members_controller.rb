class MembersController < ApplicationController

  before_action :require_member_logged_in, only: [:index, :show]
  before_action :require_organaizer_logged_in, only: [:show]
  
  def index
    if $current_party == nil
       redirect_to root_url
    end
  end

  def show
    @member = Member.find(params[:id])
    
  end

  def new
    @member = Member.new
  end
  
  def edit
      @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)
    @member.organizer = nil
    if @member.save
      flash[:success] = 'メンバーを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'メンバーの登録に失敗しました。'
      render :new
    end
  end
  
  def update
    @member = Member.find(params[:id])
   
      if @member.update(member_params)
        flash[:success] = '登録内容を変更しました。'
        redirect_to root_url
      else
         flash.now[:danger] = '登録変更に失敗しました。'
         redirect_to root_url
      end

  end  
  
  def organizer
  end
  
  def destroy
    current_member.destroy
    flash[:success] = '退会を受理しました。'
    redirect_to root_url
  end
  
  
  include SessionsHelper
  include PartiesHelper
  
  private
  def require_organaizer_logged_in
     unless organizer_logged_in?
       redirect_to root_url
     end  
  end 
  def require_member_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  def member_params
    params.require(:member).permit(:name,:birthdate,:gender,:tel,:tel1, :email,:email1, :password, :password_confirmation)
  end
  def pwcheck(email, password)
    @member = Member.find_by(email: email)
    if @member && @member.authenticate(password)
      # 認証成功
      return true
    else
      # 認証失敗
      return false
    end
  end
end
