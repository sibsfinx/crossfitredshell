# coding: utf-8

class FileUploaderInput < Formtastic::Inputs::FileInput

  def method_present?
    if object.respond_to?("#{method}?")
      object.send("#{method}?")
    else
      object.send(method).present?
    end
  end

  def file?
    object.send("#{method}?")
  end

  def file_html
    builder.file_field(method, input_html_options)
  end

  def remove_label_html
    template.content_tag(:label, class: 'remove_label') do
      template.content_tag(:span, localized_string(method, "Удалить #{method.to_s.titleize}", :remove_label))
    end
  end

  def versions_label_html
    template.content_tag(:label) do
      template.content_tag(:span, localized_string(method, "Версии", :versions))
    end
  end

  def uploader
    object.send(method).class
  end

  def versions
    uploader.versions.keys
  end

  def versions_html
    versions.map do |version|
      image = file_version version
      title = "#{version} [#{image.size}]"
      template.content_tag :span do
          template.link_to(title, image.url, :alt => title )
      end
    end.join(' ').html_safe
  end

  def file_version version
    object.send(method).send(version) || object.send(method)
  end

  def remove_html
    template.content_tag(:label, class: "remove_label") do
      template.check_box_tag("#{object_name}[remove_#{method}]", "1", false, id: "#{sanitized_object_name}_remove_#{sanitized_method_name}")
    end.html_safe
  end

  def existing_html
    if method_present?
      existing = template.content_tag(:span, object.send(method).file.filename)
      template.content_tag :div do
        template.link_to object.send(method).url, {:target=>'_blank'} do
          pic = object.send(method)
          template.image_tag(pic.url, :alt => existing, width: 120) << template.content_tag(:p, existing)
        end
      end
    end or "".html_safe
  end

  def to_html
    input_wrapping do
      label_html << file_html << existing_html
    end <<

    if file? and versions.any?
      input_wrapping do
        versions_label_html << versions_html
      end
    end <<

    if file?
      input_wrapping do
        remove_label_html << remove_html
      end
    end or ''.html_safe
  end
end
