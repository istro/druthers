class DiscussionsController < ApplicationController
  def new
  	@discussion = Discussion.new
  end

  def index
  	@discussion = Discussion.new
  	@discussions = Discussion.all
  end
end
