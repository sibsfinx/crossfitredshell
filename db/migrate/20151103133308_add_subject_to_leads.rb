class AddSubjectToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :subject, :string
  end
end
