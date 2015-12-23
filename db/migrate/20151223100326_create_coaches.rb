class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :title
      t.string :slug
      t.boolean :active
      t.integer :position, default: 0
      t.text :meta_tags
      t.text :meta_description
      t.text :content
      t.text :description

      t.timestamps null: false
    end
    add_index :coaches, :active
    add_index :coaches, :position
  end
end
