class SituationsController < ApplicationController

  def index
  end

  def new
    @situation = Situation.new
  end

  def create
    Situation.create(situation_params)
  end

  private
  def situation_params
    params.require(:situation).permit(:situation, :purpose)
  end
end
