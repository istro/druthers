class SolutionsController < ApplicationController
  def create
    @solution = current_user.solutions.new(params[:solution])
    if @solution.save
      redirect_to @solution
    else
      @discussion = @solution.discussion
      render "discussion/#{@discussion.id}"
    end
  end
end