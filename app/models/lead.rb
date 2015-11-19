class Lead < ActiveRecord::Base
  #FORM_FIELDS = [:name, :email, :phone, :cards_quantity]
  FORM_FIELDS = [:name, :phone, :cards_quantity]
  TRIAL_FORM_FIELDS = [:name, :phone]
  MANAGER_EMAIL = "crossfitredshell@yandex.ru"
  CARD_TYPES = [:common, :student]

  validates :phone, :name, presence: true

  after_commit :notify_manager, on: [:create]

  def notify_manager
    LeadMailer.manager_new_lead_email(self).deliver
  end

end
