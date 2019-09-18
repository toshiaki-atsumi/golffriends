class ParticipantsController < ApplicationController
  before_action :require_member_logged_in
  def index
     if $current_party != nil
       @schedules = Schedule.where(party_id: $current_party.id).where('date > ?',Date.today).order(date:"ASC").page(params[:page]).per(10)
     else
       redirect_to root_url
     end
  end
  
  def show
    @schedule=Schedule.find_by(id: params[:id])
    @p_name=[]
    @p_count=[]
    @schedule.mark.each_with_index  do |mark ,j|
        @p_count[j]=0
        ps = Participant.where(schedule_id: @schedule.id ,mark: mark)
        @p_name[j]=[]
       
        if ps != nil 
           ps.each do |p|
             @p_name[j]<< Member.find_by(id: p.member_id).name
             @p_count[j]=@p_name[j].count
           end
        end
    end  
  end

  def new
  end

  def create
    params[:p_id].each_with_index do | reg ,i|
      if reg == "0"
        @participant=Participant.new
        @participant.schedule_id = params[:s_id][i] 
        @participant.member_id = current_member.id
        @participant.mark = params[:marks][i]
        @participant.comment = params[:comments][i]
        @participant.save
      end
    end
    redirect_to participants_url
  end

  def edit
    @participant = Participant.find_by(id: params[:id])
    @schedule = Schedule.find_by(id: @participant.schedule_id.to_s)
  end
  
  def update
    @participant = Participant.find(params[:id])
    @participant.mark = params[:participant][:mark]
    @participant.comment = params[:participant][:comment] 
    if @participant.update(participant_params)
        flash[:success] = 'スケジュール内容を変更しました。'
        redirect_to participants_url
    else
         flash.now[:danger] = 'スケジュール変更に失敗しました。'
  　end
    end
  end
  
  def participant_params
    params.require(:participant).permit(:p_id,:s_id,:marks,:comment,:id,:mark)
  end
end
