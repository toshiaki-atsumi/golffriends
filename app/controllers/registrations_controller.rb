class RegistrationsController < ApplicationController
  def new
     @party = Party.find(params[:format])  
  end

  def delete
  end
end
