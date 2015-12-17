ActiveAdmin.register Section do
  #menu parent: I18n.t('active_admin.menu.content')
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :slug
      f.input :active
      f.input :position
      f.input :description
      f.input :content, input_html: {role: 'admin-content-editor'}
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :slug
    column :title
    column :active
    column :position
    actions
  end

  show do |section|
    h3 section.title
    div do
      section.content.html_safe
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
