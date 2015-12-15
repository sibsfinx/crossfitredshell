class CreateWodPosts < ActiveRecord::Migration
  def change
    create_table :wod_posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :effective_date

      t.timestamps null: false
    end
    add_index :wod_posts, :slug, unique: true
  end
end
