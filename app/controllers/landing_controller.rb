class LandingController < ApplicationController
  layout 'landing'

  def index
    @new_lead = Lead.new
  end
end


