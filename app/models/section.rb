class Section < ActiveRecord::Base
  include FriendlyId
  include Sluggable

  validates :title, :content, presence: true
  friendly_id :title, use: [:slugged, :finders, :history]

  scope :active, -> { where("active = ?", true).order('position ASC') }

end
