class Ranking < ActiveRecord::Base

  attr_accessible :solution_id, :user_id, :value

  belongs_to :user
  belongs_to :solution

  validates :value, presence: true


  def self.save_rankings(params)
    number_of_options = params[:vote].length

    params[:vote].each_with_index.map do |solution_id, index|
      ranking = Ranking.find_or_create_by_solution_id_and_user_id solution_id: solution_id, user_id: params[:user_id]
      ranking.update_attributes value: (number_of_options - index)
    end
    # to refactor later: make a hash with solution_id's and rankings instead of passing around the fragile array indices
  end

  def evaluate_rankings( discussion )
    # select all users that voted in this discussion, in no particular order
    users = UserDiscussion.where( discussion_id: discussion.id ) 

    ballots = users.map do |user|
      # selecting this user's votes for this discussion, in "paper" order - should be an array of rankings
      # user_ballot = discussion.rankings.select(:value, conditions: {user_id: user.id}).order(:created_at)
      (0..9).to_a.shuffle
    end

    vs = SchulzeBasic.do( ballots, 9 )
    # this should be the condorcive ballot.
    vs.ranks_abc
  end

end
