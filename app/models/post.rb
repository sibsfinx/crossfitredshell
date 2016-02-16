class Post < ActiveRecord::Base
  include FriendlyId

  validates :title, :content, :publicated_at, presence: true
  before_validation :set_publicated_at

  friendly_id :title, use: [:slugged, :finders, :history]

  mount_uploader :image, PostUploader

  scope :publicated, -> { where("publicated_at <= ? AND published = ?", "#{Time.zone.now}", true).order("publicated_at desc") }

  def published?
    publicated_at < Time.zone.now
  end

  def active?
    published?
  end

  def to_s
    "#{title}"
  end

  def should_generate_new_friendly_id?
    title_changed? or slug.nil? or slug.blank?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  protected

  def set_announce
    if announce.nil?
      self.announce = content
    end
  end

  private
  def set_publicated_at
    self.publicated_at = Time.zone.now unless publicated_at.present?
  end

end
