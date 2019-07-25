class SchedulesController < ApplicationController
  before_action :require_organaizer_logged_in
  before_action :require_party_selected
  
  def index
    @schedules = Schedule.where(party_id: $current_party.id).page(params[:page]).per(10)
  end

  def create
    require 'date'
    start_date = params[:schedule][:play_at_date].to_date
    n =params[:schedule][:repeat].to_i
    for i in 1..n
      @schedule =Schedule.new
      @schedule.date = start_date + (i-1)*7
      @schedule.mark = params[:schedule][:marks]
      @schedule.party_id = $current_party.id
      unless @schedule.save
        flash.now[:danger] = 'スケジュールの作成に失敗しました。'
        redirect_to root_url
      end
    end
     flash[:success] = 'スケジュールを登録しました。'
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
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
  def schedule_params
    params.require(:schedule).permit(:play_at_date,:mark[],:repeat)
  end
end