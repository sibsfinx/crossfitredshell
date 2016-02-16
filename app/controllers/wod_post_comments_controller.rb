class WodPostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    item = WodPost.friendly.find(params[:wod_post_id])
    comment = Comment.build_from( item, current_user.id, comment_params[:body] )
    comment.save
    if comment.save
      flash[:notice] = "#{t('activerecord.attributes.comment.added')}"
      redirect_to (get_session_return_to || wod_post_path(params[:wod_post_id]))
    else
      render controller: :wod_posts, action: :show, locals: {item: item, comment: comment}
    end
  end

  def comment_params
    params.require(:comment)
  end

  def get_session_return_to
    session.delete(:return_to)
  end
end
