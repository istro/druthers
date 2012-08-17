class SolutionsController < ApplicationController
  def create
    current_user = User.find(params[:user_id])
    @solution = current_user.solutions.new(:text => params[:solution])
    @solution.discussion_id = params[:discussion_id]
    @solution.save
    render :nothing => true
  end

  def show
    @solution = Solution.find(params[:id])
    @comment  = Comment.new
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    redirect_to @solution.discussion
  end
end
