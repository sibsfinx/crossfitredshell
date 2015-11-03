require 'digest/sha2'
class BaseMailer < ActionMailer::Base
  default Settings.mailer_defaults.symbolize_keys
  #default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@crossfitredshell.com"
  self.default_url_options = Settings.action_mailer.default_url_options.symbolize_keys
  include ApplicationHelper
end
