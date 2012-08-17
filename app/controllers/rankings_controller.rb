class RankingsController < ApplicationController
  def new
    Ranking.save_rankings params
    @discussion = Discussion.find params[:discussion_id]
    @schulze_solutions = @discussion.results
    render '/discussions/_results', layout: false
  end

end