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
    mark1 = params[:schedule][:mark1]
    mark2 = params[:schedule][:mark2]
    for i in 1..n
      @schedule =Schedule.new
      @schedule.date = start_date + (i-1)*7
      @schedule.mark = params[:schedule][:marks]
      @schedule.party_id = $current_party.id
      @schedule.mark <<  mark1 
      @schedule.mark <<  mark2
      unless @schedule.save
        flash.now[:danger] = 'スケジュールの作成に失敗しました。'
        redirect_to root_url
      end
    end
     flash[:success] = 'スケジュールを登録しました。'
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def show
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.date = params[:schedule][:date]
    @schedule.mark = params[:schedule][:mark]
    @schedule.comment =params[:schedule][:comment]
    binding.pry
    if @schedule.update(schedule_params)
        flash[:success] = '登録内容を変更しました。'
        redirect_to root_url
    else
         flash.now[:danger] = '登録変更に失敗しました。'
          render :update
    end
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
    params.require(:schedule).permit(:date,:mark,:comment,:mark1,:mark2)
  end
end