class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :user_1
      t.string :user_2

      t.timestamps
    end
  end
end