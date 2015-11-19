class AddCardTypeToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :card_type, :string
  end
end
