ActiveAdmin.register WodPost do
  #menu parent: I18n.t('active_admin.menu.content')
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      if f.object.new_record?
        f.input :title, input_html: {value: t('activerecord.attributes.wod_post.default_title')}
      else
        f.input :title
      end
      f.input :slug
      f.input :effective_date, as: :date_picker, input_html: {class: 'activeadmin-datepicker', style: 'width: 150px'}, hint: t('activerecord.attributes.wod_post.effective_date_hint', day: WodPost::NEW_WOD_DAY, hour: WodPost::NEW_WOD_HOUR)
      f.input :content, input_html: {role: 'admin-content-editor'}
      # li do
      #   f.textarea :content, role: 'admin-content-editor', class: 'admin-content-editor'
      # end
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :slug
    column :title
    column :effective_date
    actions
  end

  show do |wod_post|
    h3 wod_post.title
    h4 I18n.l(wod_post.effective_date, format: '%d/%m/%Y')
    div do
      wod_post.content.html_safe
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
