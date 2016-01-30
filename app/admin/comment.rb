ActiveAdmin.register Comment, as: 'WodPostComment' do

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    id_column
    column :user
    column :body
    column :created_at
    actions
  end

  filter :user
  filter :body
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :body
    end
    f.actions
  end



end
