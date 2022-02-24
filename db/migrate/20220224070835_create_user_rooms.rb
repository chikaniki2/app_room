class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.date_field :date_start
      t.date_field :date_end
      t.integer :price
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
