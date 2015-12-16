module Sluggable
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true
  end

  def should_generate_new_friendly_id?
    title_changed? or slug.nil? or slug.blank?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end

