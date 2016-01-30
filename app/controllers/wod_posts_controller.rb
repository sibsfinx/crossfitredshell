class WodPostsController < ApplicationController
  def index
    posts = WodPost.actual_list
    render locals: {collection: posts}
  end

  def show
    item = WodPost.friendly.find(params[:id])
    commontator_thread_show(item)
    render locals: {item: item}
  end
end
