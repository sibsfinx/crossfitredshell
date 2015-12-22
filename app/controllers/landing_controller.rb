class LandingController < ApplicationController
  layout 'landing'

  def index
    @new_lead = Lead.new
    if Time.zone.now.hour <= 22
      current_items = WodPost.current
    else
      current_items = WodPost.tomorrow
    end
    render locals: {current_items: current_items}
  end
end


