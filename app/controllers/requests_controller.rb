class RequestsController < ApplicationController
  def new
    @party = Party.find(params[:format])  
    @request = Request.new
    @member =Member.find(@party.member_id)
  end

  def show
  end
  
  def create
    binding.pry
    @request = Request.new
    @request.content = params[:request][:content]
    @request.party_id = params[:party_id] 
    @request.member_id = params[:member_id]  
    if @request.save
      flash[:success] = '入会申請しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '入会申請に失敗しました。'
      redirect_to root_url
    end
  end
  
  private
  def requests_params
    params.require(:requests).permit(:content,:member_id,:party_id)
  end
end
