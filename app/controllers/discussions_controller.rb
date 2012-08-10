class DiscussionsController < ApplicationController
  before_filter :authenticate_user!

  def new
  	@discussion = Discussion.new
  end

  def index
  	@discussion = Discussion.new
    @discussions = current_user.discussions
  end

  def create
    @discussion = current_user.discussions.create(params[:discussion])
    redirect_to @discussion
  end

  def show
    @discussion = Discussion.find(params[:id])
    @solution = Solution.new
    if signed_in?
      unless current_user.user_discussions.find_by_discussion_id params[:id] || @discussion.user = current_user
        @user_discussion = @discussion.user_discussions.new
        @user_discussion.user = current_user
        @user_discussion.save
      end
    else
      flash[:message] = 'Sign up or log in to participate in this discussion.'
    end
  end
end
