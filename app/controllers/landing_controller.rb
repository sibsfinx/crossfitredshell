class LandingController < ApplicationController
  layout 'landing'

  def index
    @new_lead = Lead.new
    current_items = WodPost.actual
    render locals: {current_items: current_items}
  end
end


