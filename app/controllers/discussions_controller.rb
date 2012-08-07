class DiscussionsController < ApplicationController
  def index
  	@discussion = Discussion.new
  end
end
