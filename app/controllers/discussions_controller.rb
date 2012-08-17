class DiscussionsController < ApplicationController
  before_filter :authenticate_user!
  layout 'application', :except => :update

  def new
  	@discussion = Discussion.new
  end

  def index
  	@discussion = Discussion.new
    @discussions = current_user.discussions
    @user_discussions = current_user.user_discussions
  end

  def create
    @discussion = current_user.discussions.create(params[:discussion])
    redirect_to @discussion
  end

  def show
    @solution = Solution.new

    @discussion         = Discussion.find(params[:id])
    @sortable_solutions = @discussion.ranked_solutions current_user

    @schulze_solutions  = @discussion.results if @discussion.voted_on?

    @mode = @sortable_solutions[0].nil? ? 'none' : 'block'
    @votable = @discussion.votable? ? 'block' : 'none'

    if signed_in?
      unless current_user.user_discussions.find_by_discussion_id params[:id] || @discussion.user = current_user
        @user_discussion      = @discussion.user_discussions.new
        @user_discussion.user = current_user
        @user_discussion.save
      end
    else
      flash[:message] = 'Sign up or log in to participate in this discussion.'
    end
  end

  def votable
    d = Discussion.find(params[:discussion_id])
    d.mark_votable
    render :nothing => true
  end

  def update
    @discussion   = Discussion.find(params[:id])

    @new_solution_style = (@discussion.votable? ? "none" : "block")

    all_solutions = @discussion.ranked_solutions current_user
    current_solution_ids = params[:page].split(",").map{|n| n.to_i}
    @appendables = all_solutions - current_solution_ids.map {|id| Solution.find id }

    render layout: false
  end
end
