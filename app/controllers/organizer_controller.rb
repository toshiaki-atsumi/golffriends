class OrganizerController < ApplicationController
  def new
     @party = Party.find(params[:format])
  end
  
  def create
    @party = Party.find(params[:party_id])
    @member =Member.find(current_member.id)
    password = params[:organizer][:password]
    if (@party.member_id == current_member.id) && @party.authenticate(password)
       organizer=current_member.id
       current_party = @party
        flash.now[:succsess] = '認証に成功しました。'
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new  
    end  
    redirect_to root_url
  end

  def delete
      organizer = nil
      current_party = nil
  end
  
  include SessionsHelper
  include OrganizerHelper
  
  private

  def require_member_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  def require_organaizer_logged_in
     unless organize_logged_in?
       redirect_to root_url
     end  
  end 
  def pwcheck(password)
    @member = Member.find_by(email: email)
    if @party.authenticate(password)
      # 認証成功
      return true
    else
      # 認証失敗
      return false
    end
  end
end

