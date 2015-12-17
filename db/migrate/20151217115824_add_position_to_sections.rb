class AddPositionToSections < ActiveRecord::Migration
  def change
    add_column :sections, :position, :integer, default: 0
    add_index :sections, :position
  end
end
