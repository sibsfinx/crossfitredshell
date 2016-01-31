class PostsController < ApplicationController
  def index
    items = Post.publicated
    render locals: {collection: items}
  end

  def show
    item = Post.friendly.find(params[:id])
    render locals: {item: item}
  end

end
