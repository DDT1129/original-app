class SituationsController < ApplicationController

  def index
  end

  def new
    @situation = Situation.new
  end

  def create
    @situation = Situation.new(situation_params)
    if @situation.save
      redirect_to root_path
    else
      render :new  
    end
  end

  private
  def situation_params
    params.require(:situation).permit(:purpose, :genre_id)
  end
end
