ActiveAdmin.register Lead do
  index do
    column :name
    column :phone
    column :email
    column :subject do |lead|
      t("activerecord.attributes.lead.subjects.#{lead.subject}") if lead.subject.present?
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
