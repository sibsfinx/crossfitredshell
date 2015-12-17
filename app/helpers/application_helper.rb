module ApplicationHelper

  def page_title title
    "#{title} &mdash; #{Settings.app.title}".html_safe
  end

  def is_admin?
    current_admin_user.present?
  end

end
