class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new( params[:comment] )

    if @comment.save
      redirect_to :back, notice: "Comment created."
    else
      render :new
    end
  end

  def new
    @comment = @commentable.comments.new
  end

private
  def load_commentable
    type, id = params[:comment][:commentable_type], params[:comment][:commentable_id]
    params[:comment].delete(:commentable_id)
    params[:comment].delete(:commentable_type)
    @commentable = type.constantize.find(id)
  end
end