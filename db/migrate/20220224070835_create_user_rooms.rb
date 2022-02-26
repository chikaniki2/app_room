class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.date :date_start
      t.date :date_end
      t.integer :member
      t.integer :price
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
