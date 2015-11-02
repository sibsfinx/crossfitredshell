ActiveAdmin.register Lead do
  index do
    column :name
    column :phone
    column :email
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
