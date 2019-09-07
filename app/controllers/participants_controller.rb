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
    @participant = Participant.find_by(params[:id])
    @schedule = Schedule.where(id: @participant.schedule_id.to_s)
  end
  
  def participant_params
    params.permit(:p_id,:s_id,:marks,:comment)
  end
end
