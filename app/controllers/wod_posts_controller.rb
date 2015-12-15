class WodPostsController < ApplicationController
  def index
    posts = WodPost.ordered
    current_items = WodPost.current
    render locals: {collection: posts, current_items: current_items}
  end

  def show
    item = WodPost.friendly.find(params[:id])
    render locals: {item: item}
  end
end
