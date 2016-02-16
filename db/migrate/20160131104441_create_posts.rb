class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :publicated_at
      t.boolean :published, default: true
      t.text :meta_description
      t.text :meta_tags
      t.string :image

      t.timestamps null: false
    end
    add_index :posts, :published
  end
end
