class PartiesController < ApplicationController
   before_action :require_member_logged_in
 
   
  def index
    @parties = Party.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @parties= Party.where(member_id: current_member.id)
    counts(@parties)
  end

  def new
    @party = Party.new
  end
  
  def edit
    @party = Party.find(params[:id])  
  end

  def create
    @party = Party.new(party_params)
    @party.member_id = current_member.id
    if @party.save
      flash[:success] = '会を創設しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '会の創設に失敗しました。'
      render :new
    end
  end
  
  
  def update
    binding.pry
    @party = Party.find(params[:id])
    @party.member_id = current_member.id   
    password = params[:party][:password]
    if pwcheck(password)
   
      if @party.update(party_params)
        flash[:success] = '登録内容を変更しました。'
        redirect_to root_url
      else
         flash.now[:danger] = '登録変更に失敗しました。'
          render :new
      end
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new  
    end
  end  
  
  include SessionsHelper
  include OrganizerHelper
  
  
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
  def party_params
    params.require(:party).permit(:name,:president,:content,:member_id,:password, :password_confirmation)
  end
  def pwcheck(password)
    if @party.authenticate(password)
      # 認証成功
      return true
    else
      # 認証失敗
      return false
    end
  end
end
