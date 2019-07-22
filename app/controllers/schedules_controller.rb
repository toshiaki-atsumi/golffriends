class SchedulesController < ApplicationController
  before_action :require_organaizer_logged_in
  before_action :require_party_selected
  
  def index
  end

  def create
    
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
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
  
  def require_party_selected
    if $current_party == nil
       redirect_to root_url
    end
  end