class DiscussionsController < ApplicationController
  def new
  	@discussion = Discussion.new
  end

  def index
  	@discussion = Discussion.new
  	@discussions = Discussion.all
  end

  def create
    @discussion = current_user.discussions.create(params[:discussion])
    redirect_to @discussion
  end

  def show
    @discussion = Discussion.find(params[:id])
    @solution = Solution.new
  end
end
