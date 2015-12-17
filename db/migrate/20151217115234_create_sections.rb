class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.boolean :active

      t.timestamps null: false
    end
    add_index :sections, :active
  end
end
