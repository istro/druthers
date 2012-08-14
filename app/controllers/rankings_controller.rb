class RankingsController < ApplicationController


def new
  render nothing: true
end

#  Parameters: {"vote"=>["2", "3", "1"], "user_id"=>"5", "discussion_id"=>"3"}

  # def new
  #   # an array of solution id's in order of preference gets posted.
  #   # iterating over the array we assign rankings to the solutions, and create votes.  
  #   number_of_options = params[:vote].length
  #   @ballot = params[:vote].each_with_index.map do |solution_id, index|
  #   # however, we must make sure it updating if this vote already exists
  #   # don't know how to check existence of three attributes


  #     Ranking.create({solution_id: solution_id, 
  #                  user_id: params[:user_id],
  #                  discussion_id: params[:discussion_id],
  #                  ranking: number_of_options-index})

  #   end
  #   # flash a success message on screen with jquery?
  #   render nothing: true
  # end

  # def evaluate_rankings(discussion)
  #   # select all users that voted in this discussion, in no particular order
  #   users = User_discussions.select("user_id", conditions: {discussion_id: discussion.id}) 
  #   ballots = []
  #   users.each do |user|
  #     # selecting this user's votes for this discussion, in "paper" order - should be an array of rankings
  #     user_ballot = discussion.solutions.rankings.select(:value, conditions: {user_id: user}).order(:created_at)
  #     ballots << user_ballot
  #   end
  #   # ballots should now be an array ready for schulze. Let's feed 'em to him!
  #   vs = SchulzeBasic.do ballots, ballots.length
  #   # this should be the condorcive ballot.
  #   vs.ranks_abc
  # end

end