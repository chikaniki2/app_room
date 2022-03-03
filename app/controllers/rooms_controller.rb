class RoomsController < ApplicationController
  def index
    @rooms = Room.all #allメソッドはusersテーブルのレコードを全て取得できるメソッド
  end

  def new
    if !user_signed_in?
      redirect_to "/users/sign_in"
    else
      @room = Room.new
      @user = current_user
    end
  end
 
  def create
    @room = Room.new(def_params)
	  if @room.save
	    flash[:notice] = "新規登録しました"
	    redirect_to :rooms
	  else
	    render "new"
	  end
  end
 
  def show
    @room = Room.find(params[:id])
  end
 
  def edit
    @room = Room.find(params[:id])
    @user = current_user
  end
 
  def update
    @room = Room.find(params[:id])
      if @room.update(def_params) 
        flash[:notice] = "ID「#{@room.id}」の情報を更新しました"
        redirect_to :rooms
      else
        render "edit"
      end
  end
 
  def destroy
    room = Room.find(params[:id])
    room.destroy
    flash[:notice] = "削除しました"
    redirect_to :rooms
  end

  # 部屋検索結果
  def search
    # エリアと部屋名から検索
    # @rooms = Room.where('address LIKE ?', "%#{params[:area]}%").where('name LIKE ?', "%#{params[:name]}%")
    
    # エリア、部屋名、説明文から検索
    @rooms = Room.where('address LIKE ?', "%#{params[:area]}%").where(['name LIKE (?) OR description LIKE(?)', "%#{params[:name]}%", "%#{params[:name]}%"])
  end

  
    # ログインが必要な物

    # 登録した部屋一覧
    def post
      if !user_signed_in?
        redirect_to "/users/sign_in" # isnot login 
      else
        @rooms = Room.where(user_id: current_user.id)
        # @rooms = current_user.rooms #リレーション読み込みできない?
      end
    end

    # 予約一覧
    def reservations
      if !user_signed_in?
        redirect_to "/users/sign_in" # isnot login 
      else
        @reservations = UserRoom.where(user_id: current_user.id)
      end
    end




  private
    # create,updateの共通パラメータ（ストロング）
    def def_params
      params.require(:room).permit(:address, :name, :description, :price, :user_id)
    end

end
