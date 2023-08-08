class FamilyAccountsController < ApplicationController
  before_action :check_family_account, only: [:new]

  # indexアクションは必要なかったが、createアクションの後にindexが呼ばれてエラーになることからviewも併せて作成しエラー回避
  def index
    @family_account = FamilyAccount.new
  end
  
  def new
    @family_account = FamilyAccount.new
  end

  def create
    @family_account = FamilyAccount.new(family_account_params)
    if check_code && @family_account.save
      redirect_to root_path
    else
      flash.now[:alert] = "入力したコードが一致しません"
      render :new
    end
  end

  private

  def family_account_params
    params.require(:family_account).permit(:family_code, :user_id).merge(user_id: current_user.id)
  end

  def check_code
    @user = User.find_by(id: current_user.id) 
    unless @family_account.family_code != @user.code
      return true
    else
      return false
    end
  end

  #ユーザーが重複してアカウント作成しないように登録済みの場合はトップページに遷移させる
  def check_family_account
    if current_user
      @family_account = FamilyAccount.find_by(user_id: current_user.id)
    end
    if  @family_account && @family_account.family_code == current_user.code
      redirect_to root_path
      return
    end
  end
end
