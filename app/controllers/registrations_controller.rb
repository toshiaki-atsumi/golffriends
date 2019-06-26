class RegistrationsController < ApplicationController
  def new
     @request = Request.find(params[:format]) 
     @party = Party.find(@request.party_id)  
  end

  def delete
  end
  
  def create
    binding.pry
  end
end
