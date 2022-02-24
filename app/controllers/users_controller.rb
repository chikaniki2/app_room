class UsersController < ApplicationController
  def index
    @users = User.all #allメソッドはusersテーブルのレコードを全て取得できるメソッド
  end

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(def_params)
	  if @user.save
	    flash[:notice] = "新規登録しました"
	    redirect_to :users
	  else
	    render "new"
	  end
  end
 
  def show
    @user = User.find(params[:id]) #paramsはGETで取得した値。User.find(1)等になる。単体レコードの抽出。
  end
 
  def edit
    @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
      if @user.update(def_params) 
        flash[:notice] = "ID「#{@user.id}」の情報を更新しました"
        redirect_to :users
      else
        render "edit"
      end
  end
 
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :users
  end


  private
    # create,updateの共通パラメータ（ストロング）
    def def_params
      params.require(:user).permit(:name, :email, :age, :introduction)
    end
end
