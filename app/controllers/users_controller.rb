class UsersController < ApplicationController

  def profile
    if !user_signed_in?
      redirect_to "/users/sign_in" # isnot login 
    else
      @user = current_user
    end
  end

  def account
    if !user_signed_in?
      redirect_to "/users/sign_in" # isnot login 
    else
      @user = current_user
    end
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
      params.require(:user).permit(:name, :description, :image)
    end
end