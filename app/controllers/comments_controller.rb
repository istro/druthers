class CommentsController < ApplicationController
  def create
    @solution = Solution.find params[:solution_id]
    @comment = @solution.comments.new (params[:comment])
    @comment.user = current_user 
    @comment.save

    redirect_to discussion_solution_path(@solution.discussion, @solution)
  end
end