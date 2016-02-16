class WodPostsController < ApplicationController
  def index
    posts = WodPost.actual_list
    items = posts.collect{|p| {item: p, comments_count: p.comment_threads.count}}
    render locals: {collection: items}
  end

  def show
    item = WodPost.friendly.find(params[:id])
    comment = Comment.new
    render locals: {item: item, comment: comment}
  end

end
