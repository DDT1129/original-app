class SituationsController < ApplicationController

  def index
    if current_user
      @family_account = FamilyAccount.find_by(user_id: current_user.id)
    end
    
    @today = Date.today #今日の日付を取得
    @now = Time.now     #現在時刻を取得
    
    # []を作って、userモデルからデータを持ってくる（登録ユーザーを表示するため）、最新の表示だけに設定   
    @situations = [] 
    # Whereで同じ家族コードのみ表示するようにフィルターをかける
    if current_user != nil && @family_account #ユーザーが登録する前にエラーになるのを防ぐため && ユーザー登録後に家族アカウントでコード入力せずトップページに戻ってもエラーを回避
      User.where(code: @family_account.family_code).each do |user| #ユーザーモデルのcodeにfamily_accountのfamily_codeと同じものが該当するかwhereメソッドでフィルタリングする
        latest_situation = user.situations.order(created_at: :desc).first #上記フィルターに該当するデータをさらに降順で最新のもののみ、変数に代入
        @situations << latest_situation if latest_situation #上記で設定した変数（最新の投稿）が取得された場合、また配列に追加する
      end    
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

  def destroy
    situation = Situation.find(params[:id])
    situation.destroy
    redirect_to root_path
  end

  private
  def situation_params
    params.require(:situation).permit(:purpose, :genre_id, :user_id, :family_code).merge(user_id: current_user.id, family_code: current_user.code)
  end
end
