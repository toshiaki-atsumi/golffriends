class ParticipantsController < ApplicationController
  before_action :require_member_logged_in
  def index
     @schedules = Schedule.where(party_id: $current_party.id).where('date > ?',Date.today).order(date:"ASC").page(params[:page]).per(10)
  end
  
  def show
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
  end

  def edit
    @participant = Participant.find_by(id: params[:id])
    @schedule = Schedule.find_by(id: @participant.schedule_id.to_s)
  end
  
  def update
    @participant = Participant.find_by(id: params[:id])
    @participant.mark = params[:participant][:mark]
    @participant.comment = params[:participant][:comment] 
    if @paticipant.update(participant_params)
        flash[:success] = 'スケジュール内容を変更しました。'
        redirect_to participant_index_url
    else
         flash.now[:danger] = 'スケジュール変更に失敗しました。'
  　end
    end
  end
  
  def participant_params
    params.permit(:p_id,:s_id,:marks,:comment)
  end
end
