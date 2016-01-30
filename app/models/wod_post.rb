class WodPost < ActiveRecord::Base
  #include Sluggable
  include FriendlyId

  NEW_WOD_HOUR = 19
  NEW_WOD_DAY = 1

  acts_as_commontable

  validates :title, :content, :effective_date, presence: true
  friendly_id :wod_slug, use: [:slugged, :finders, :history]

  scope :ordered, -> { order("effective_date desc") }
  scope :actual_today, -> { ordered.where("effective_date <= ?", Time.zone.now.beginning_of_day) }
  scope :actual_tomorrow, -> { ordered.where("effective_date <= ?", 1.day.from_now.in_time_zone.beginning_of_day) }
  scope :today, -> { where(effective_date: Time.zone.now.beginning_of_day) }
  scope :tomorrow, -> { where(effective_date: 1.day.from_now.in_time_zone.beginning_of_day) }

  #paginates_per 10

  def to_s
    "#{title}"
  end

  def self.actual_list
    if Time.zone.now.hour >= NEW_WOD_HOUR
      WodPost.actual_tomorrow
    else
      WodPost.actual_today
    end
  end

  def self.actual
    if Time.zone.now.hour >= NEW_WOD_HOUR
      WodPost.tomorrow
    else
      WodPost.today
    end
  end

  def wod_slug
    "#{title}-#{effective_date.strftime('%d-%m-%Y')}"
  end

  def wod_title
    "#{title} #{effective_date.strftime('%d-%m-%Y')}"
  end

  def should_generate_new_friendly_id?
    title_changed? or effective_date_changed? or slug.nil? or slug.blank?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
