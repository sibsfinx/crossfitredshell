ActiveAdmin.register Post do
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :slug
      f.input :publicated_at, as: :date_picker, input_html: {class: 'activeadmin-datepicker', style: 'width: 150px'}, hint: t('activerecord.attributes.post.publicated_at_hint')
      f.input :published, hint: t('activerecord.attributes.post.published_hint')
      br
      f.input :image, :as => :file_uploader
      f.input :announce, as: :string, hint: t('activerecord.attributes.post.announce_hint')
      f.input :content, input_html: {role: 'admin-content-editor'}
      unless f.object.new_record?
        f.input :meta_tags,
          input_html: {role: 'select2-tags', style: 'min-width: 400px;'}
        f.input :meta_description, input_html: {role: 'autosize', rows: false, cols: false}
      end
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :slug
    column :title
    column :publicated_at
    column :published
    column :pinned
    column :departments do |post|
      post.departments.collect{|d| d.title}.join(', ') if post.departments.present?
    end
    column :language
    column :contest
    #column :content do |post|
    #  #truncate_html post.content.html_safe
    #  post.content.html_safe
    #end
    actions
    column :view do |post|
      link_to 'view@site', post_url(post)
    end
  end

  show do
    h3 post.title
    h4 do
      link_to "#{post_path(post.slug)}", post_path(post.slug)
    end
    p post.publicated_at
    p post.published
    div do
      post.content.html_safe
    end
  end

  #permit_params *Post.attribute_names
  controller do
    def permitted_params
      params.permit!
    end
  end

end
