class WodPostsController < ApplicationController
  def index
    posts = WodPost.actual_list
    render locals: {collection: posts}
  end

  def show
    item = WodPost.friendly.find(params[:id])
    comment = Comment.new
    render locals: {item: item, comment: comment}
  end

end
