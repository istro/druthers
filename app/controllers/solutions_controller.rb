class SolutionsController < ApplicationController
  def create
    @solution = current_user.solutions.new(params[:solution])
    @solution.discussion_id = params[:discussion_id]
    @solution.save
    redirect_to @solution.discussion
  end

end
