class RankingsController < ApplicationController
  def new
    Ranking.save_rankings params
    render nothing: true
  end
end