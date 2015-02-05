class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :story_id
      t.text :content
      t.integer :chapter_number

      t.timestamps
    end
  end
end