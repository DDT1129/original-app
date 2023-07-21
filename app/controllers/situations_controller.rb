class SituationsController < ApplicationController

  def index
    @today = Date.today #今日の日付を取得
    @now = Time.now     #現在時刻を取得
    @situations = Situation.all
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
    params.require(:situation).permit(:purpose, :genre_id, :user_id).merge(user_id: current_user.id)
  end
end
