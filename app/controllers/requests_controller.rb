class RequestsController < ApplicationController
   before_action :require_member_logged_in
   before_action :require_organaizer_logged_in, only: [:index]
   
  def index
     @parties= Party.where(member_id: current_member.id)
     if @parties == nil
       redirect_to root_url
     end
  end 

  def new
    @party = Party.find(params[:format])  
    @request = Request.new
    @member =Member.find(@party.member_id)
  end

  def show
     @requests = Request.where(member_id: current_member.id)
  end
  
  def create
    @request = Request.new
    @request.content = params[:request][:content]
    @request.party_id = params[:party_id] 
    @request.member_id = params[:member_id] 
    @request.status = '申請中'
    if @request.save
      flash[:success] = '入会申請しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '入会申請に失敗しました。'
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
 
  def requests_params
    params.require(:requests).permit(:content,:member_id,:party_id)
  end
end
