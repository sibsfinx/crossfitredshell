ActiveAdmin.register Lead do
  index do
    column :name
    column :phone
    column :email
    column :subject do |lead|
      t("activerecord.attributes.lead.subjects.#{lead.subject}") if lead.subject.present?
    end
    column :card_type do |lead|
      t("activerecord.attributes.lead.card_types.#{lead.card_type}") if lead.card_type.present?
    end
    column :cards_quantity
    column :created_at
    actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
