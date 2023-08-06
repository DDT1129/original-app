class MemosController < ApplicationController
  def index
    if current_user
      @family_account = FamilyAccount.find_by(user_id: current_user.id)
    end
    
    # []を作って、userモデルからデータを持ってくる（登録ユーザーを表示するため）
    @memos = [] 
    # Whereで同じ家族コードのみ表示するようにフィルターをかける
    if current_user != nil && @family_account #ユーザーが登録する前にエラーになるのを防ぐため && ユーザー登録後に家族アカウントでコード入力せずトップページに戻ってもエラーを回避
      User.where(code: @family_account.family_code).each do |user| 
        @memos += user.memos #上記フィルターに該当するデータを配列に全て入れる
      end    
    end
  end

  def new
    @memo = Memo.new
  end
    
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to '/memos'
    else
      render :new
    end
  end
    
  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to '/memos'
  end

  def completed
    @memo = Memo.find(params[:id])
    @memo.update(completed: true)
    redirect_to '/memos'
  end

  def incompleted
    @memo = Memo.find(params[:id])
    @memo.update(completed: false)
    redirect_to '/memos'
  end

      
  private
  
  def memo_params
    params.require(:memo).permit(:text, :user_id, :family_code).merge(user_id: current_user.id, family_code: current_user.code)
  end
end
