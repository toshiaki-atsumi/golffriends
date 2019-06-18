class MembersController < ApplicationController

  before_action :require_member_logged_in, only: [:index, :show]

  def index
    @members = member.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @members = Member.all
    counts(@members)
  end

  def new
    @member = Member.new
  end
  
  def edit
      @member = current_member
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = 'メンバーを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'メンバーの登録に失敗しました。'
      render :new
    end
  end
  
  def update
    if @member.save
      flash[:success] = '登録内容を変更しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '登録変更に失敗しました。'
      render :new
    end
  end  
  include SessionsHelper
  
  private

  def require_member_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  def member_params
    params.require(:member).permit(:name,:birthdate,:gender,:tel,:tel1, :email,:email1, :password, :password_confirmation)
  end

end
