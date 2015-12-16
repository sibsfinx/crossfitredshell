class WodPost < ActiveRecord::Base
  #include Sluggable
  include FriendlyId

  validates :title, :content, :effective_date, presence: true
  friendly_id :wod_slug, use: [:slugged, :finders, :history]

  scope :ordered, -> { order("effective_date desc") }
  scope :current, -> { where(effective_date: Time.now.beginning_of_day) }

  #paginates_per 10

  def wod_slug
    "#{title}-#{effective_date.strftime('%d-%m-%Y')}"
  end

  def should_generate_new_friendly_id?
    title_changed? or effective_date_changed? or slug.nil? or slug.blank?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
