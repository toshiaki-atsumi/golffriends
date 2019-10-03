class PartiesController < ApplicationController
   before_action :require_member_logged_in
   before_action :require_organaizer_logged_in, only: [:show, :update,:destroy]
   
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
    $current_party = @party
    party_organizer?
  end

  def create
    @party = Party.new(party_params)
    @party.member_id = current_member.id
    current_member.organizer = 'YES'
    current_member.save
    if @party.save
      $current_party = @party
      flash[:success] = '会を創設しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '会の創設に失敗しました。'
      render :new
    end
  end
  
  
  def update
    @party = Party.find(params[:id])
    party_organizer?
      if @party.update(party_params)
        flash[:success] = '登録内容を変更しました。'
        redirect_to root_url
      else
         flash[:danger] = '登録変更に失敗しました。'
        redirect_to root_url
      end
  end  
  
  def destroy
    @party = Party.find(params[:id])
    party_organizer?
    if @party.destroy
      $current_party = nil
      current_member.organizer = ""
      current_member.save
      flash[:success] = '会を削除しました。'
      redirect_to root_url
    else
      flash[:danger] = '会の創設に失敗しました。'
      redirect_to root_url
    end
    
    
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
  def party_organizer?
     unless @party.member_id == current_member.id
        redirect_to root_url
     end
  end
  
  def party_params
    params.require(:party).permit(:name,:president,:content,:member_id,:password, :password_confirmation)
  end
end
