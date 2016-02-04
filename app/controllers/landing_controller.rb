class LandingController < ApplicationController
  layout 'landing'

  def index
    @new_lead = Lead.new
    current_items = WodPost.actual
    last_post = Post.publicated.first
    render locals: {current_items: current_items, last_post: last_post}
  end
end


