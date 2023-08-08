class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_memo, only: [:edit, :update, :destroy, :completed, :incompleted]

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

  def edit
  end

  def update
    if @memo.update(edit_memo_params)
      redirect_to memos_path
    else
      render :edit
    end
  end
    
  def destroy
    @memo.destroy
    redirect_to '/memos'  
  end

  def completed
    @memo.update(completed: true)
    redirect_to '/memos'
  end

  def incompleted
    @memo.update(completed: false)
    redirect_to '/memos'
  end
      
  private
  
  def memo_params
    params.require(:memo).permit(:text, :user_id, :family_code).merge(user_id: current_user.id, family_code: current_user.code)
  end

  #家族間でメモを共有し、誰でも削除、完了チェック、編集ができるが編集した際に当初の作成者が更新されないためのもの。「text」のみ更新されるように設定
  def edit_memo_params
    params.require(:memo).permit(:text)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end
end
