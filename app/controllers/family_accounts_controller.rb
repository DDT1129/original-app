class FamilyAccountsController < ApplicationController
  
  def new
    @family_account = FamilyAccount.new
  end

  def create
    @family_account = FamilyAccount.new(family_account_params)
    if @family_account.save
      redirect_to root_path,notic: "家族コードを作成しました"
    else
      render :new
    end
  end

  private

  def family_account_params
    params.require(:family_account).permit(:family_code, :user_id).merge(user_id: current_user.id)
  end
end
