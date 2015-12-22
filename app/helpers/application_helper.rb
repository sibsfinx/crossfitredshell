module ApplicationHelper

  def page_title title
    "#{title} &mdash; #{Settings.app.title}".html_safe
  end

  def is_admin?
    current_admin_user.present?
  end

  def strip_html(str, options={})
    if options[:urlencode_new_line]
      sym = ".%0a"
    else
      sym = ".\n"
    end
    document = Nokogiri::HTML.parse(str)
    document.css("br").each { |node| node.replace(sym) }
    document.text
  end

end
