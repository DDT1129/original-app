class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end
    
  def create
    @memo = Mmemo.new(memo_params)
    if @memo.save
      redirect_to 'memos#index'
    else
      render :new
    end
  end
    
  def destroy
     memo = Memo.find(params[:id])
     memo.destroy
     redirect_to 'memos#index'
  end
      
  private
    def memo_params
      params.require(:memo)permit(:text, :user_id).merge(user_id: current_user.id)
    end
end
