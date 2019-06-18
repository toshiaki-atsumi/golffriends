class PartiesController < ApplicationController
   before_action :require_member_logged_in
   before_action :require_organaizer_logged_in, only: [:index, :show]
   
  def index
    @perties = perty.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @perties = perty.order(id: :desc).page(params[:page]).per(10)

    counts(@parties)
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      flash[:success] = '会を創設しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '会の創設に失敗しました。'
      render :new
    end
  end
  
  include SessionsHelper
  
  private
  
  def require_organaizer_logged_in
     unless current_member == organaizer
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
end
