ActiveAdmin.register Coach do
  #menu parent: I18n.t('active_admin.menu.content')
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :slug
      f.input :active
      f.input :position
      f.input :image, :as => :file_uploader
      f.input :description
      f.input :content, input_html: {role: 'admin-content-editor'}
      f.input :meta_tags, input_html: {role: 'select2-tags', style: 'min-width: 400px;'}
      f.input :meta_description, input_html: {role: 'autosize', rows: false, cols: false}
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

  show do |coach|
    h3 coach.title
    div do
      coach.content.html_safe
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
