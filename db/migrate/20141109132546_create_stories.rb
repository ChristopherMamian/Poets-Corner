class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
  end
end