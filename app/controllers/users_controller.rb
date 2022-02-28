class UsersController < ApplicationController

  def profile
    @user = current_user
  end

  def account
    @user = current_user
  end
 
  def update
    @user = current_user
      if @user.update(def_params) 
        flash[:notice] = "更新しました"
        redirect_to("/users/profile")
      else
        flash[:alert] = "更新できませんでした"
        redirect_to("/users/profile")
      end
  end

  private
    def def_params
      params.require(:user).permit(:name, :description)
    end
end