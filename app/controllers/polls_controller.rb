class PollsController < ApplicationController
  def index
  	@poll = Poll.new
  end
end