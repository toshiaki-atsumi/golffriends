class ParticipantsController < ApplicationController
  
  def index
     @schedules = Schedule.where(party_id: $current_party.id).where('date > ?',Date.today).page(params[:page]).per(10)
  end
  
  def show
  end

  def new
  end

  def create
  end

  def edit
  end
end
