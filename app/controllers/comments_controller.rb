class CommentsController < ApplicationController
  def index
    if params[:user_id]
      @commentable = User.find(params[:user_id])
    else
      @commentable = Contact.find(params[:contact_id])
    end

    if params[:my_comments]
      render json: @commentable.authored_comments
    else
      render json: @commentable.comments
    end
  end

  private
  def comment_params
    params.require(:comment).permit(
    :author_id, :commentable_id, :commentable_type, :comment
    )
  end
end
