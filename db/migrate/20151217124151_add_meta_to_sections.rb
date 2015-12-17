class AddMetaToSections < ActiveRecord::Migration
  def change
    add_column :sections, :meta_tags, :text
    add_column :sections, :meta_description, :text
  end
end
