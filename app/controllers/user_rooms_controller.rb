class UserRoomsController < ApplicationController

    def index
      @user_rooms = UserRoom.all
    end

    def new
      # 別モデルのバリデーションチェック方法が不明なため、
      # if文で手動エラーチェック
      error = [] # エラー検知したらエラー文に追記

      if params[:date_start]=="" || params[:date_end]==""
        error.push("日付は必須です")
      else
        if params[:date_start].to_date >= params[:date_end].to_date
          error.push("チェックアウトはチェックイン以降にしてください")
        end

        if params[:date_start].to_date <= Date.today
          error.push("チェックインは明日以降にしてください")
        end
      end

      if params[:member].to_i <= 0 || params[:member] == ""
        error.push("利用人数は必須です")
      end

      # エラー文があればエラー表示。なければ確認画面へ
      if error.size > 0
        flash[:alert] = error
        redirect_to room_path(id:params[:room_id]) # 部屋ページに戻る
      else
        # GETで送られてきたparamsをインスタンス変数に代入. new側で取り出す。
        @user_room = UserRoom.new
        @param = params

        # 宿泊費の計算
        price = params[:price].to_i
        member = params[:member].to_i
        day = (params[:date_end].to_date - params[:date_start].to_date).to_i
        @param[:price] = price * member * day
      end
    end
  
    def create
      @user_room = UserRoom.new(def_params)
      if @user_room.save
        flash[:notice] = "新規登録しました"
        redirect_to reservations_rooms_path
      else
        redirect_to "rooms/index"
      end
    end
  
    def show
      @user_room = UserRoom.find(params[:id])
    end
  
    def edit
      @user_room = UserRoom.find(params[:id])
    end
  
    def update
    end
  
    def destroy
      user_room = UserRoom.find(params[:id])
      user_room.destroy
      flash[:notice] = "削除しました"
      redirect_to reservations_rooms_path
    end


    private
      # create,updateの共通パラメータ（ストロング）
      def def_params
        params.require(:user_room).permit(:user_id, :room_id, :date_start, :date_end, :price, :member)
      end
end
