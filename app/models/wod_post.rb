class WodPost < ActiveRecord::Base
  include FriendlyId

  validates :title, :content, :effective_date, presence: true

  friendly_id :title, use: [:slugged, :finders, :history]

end
