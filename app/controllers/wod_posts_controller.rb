class WodPostsController < ApplicationController
  def index
    posts = WodPost.actual_list
    render locals: {collection: posts}
  end

  def show
    item = WodPost.friendly.find(params[:id])
    render locals: {item: item}
  end
end
