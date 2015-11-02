class LeadMailer < BaseMailer
  def manager_new_lead_email(lead)
    @lead = lead
    mail(to: Lead::MANAGER_EMAIL, subject: 'Новая заявка на сайте crossfitredshell.com')
  end

end
