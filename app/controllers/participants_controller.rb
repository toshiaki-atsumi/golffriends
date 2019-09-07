class ParticipantsController < ApplicationController
  
  def index
     @schedules = Schedule.where(party_id: $current_party.id).where('date > ?',Date.today).page(params[:page]).per(10)
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
  end
  
  def participant_params
    params.permit(:p_id,:s_id,:marks,:comment)
  end
end
