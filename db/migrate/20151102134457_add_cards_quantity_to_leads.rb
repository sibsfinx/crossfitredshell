class AddCardsQuantityToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :cards_quantity, :integer, default: 1
  end
end
