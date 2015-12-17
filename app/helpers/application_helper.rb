module ApplicationHelper

  def page_title title
    "#{title} &mdash; #{Settings.app.title}".html_safe
  end

end
