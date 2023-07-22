class SituationsController < ApplicationController

  def index
    @today = Date.today #今日の日付を取得
    @now = Time.now     #現在時刻を取得
    
    # []を作って、userモデルからデータを持ってくる（登録ユーザーを表示するため）、最新の表示だけに設定   
    @situations = [] 
    User.all.each do |user| 
      latest_situation = user.situations.order(created_at: :desc).first
      @situations << latest_situation if latest_situation
    end
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
