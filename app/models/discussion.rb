class Discussion < ActiveRecord::Base
  attr_accessible :question
  belongs_to :user
  has_many :solutions
  has_many :user_discussions
  has_many :rankings, through: :solutions

  validates :question, presence: true

  def results
    aggregate_ranked_solutions = []

    self.schulze_ranks.each_with_index do |rank, index|
      aggregate_ranked_solutions[rank] = self.solutions[index]
    end

    aggregate_ranked_solutions.reverse
  end

  def ranked_solutions(user)
    rankings = self.rankings.find_all_by_user_id user.id
    sorted_solutions = rankings.sort_by(&:value).reverse.map { |ranking| ranking.solution }
    unranked = (self.solutions - sorted_solutions).reverse
    unranked.each {|solution| sorted_solutions.unshift solution }
    sorted_solutions
  end

  def participants
    self.rankings.map(&:user).uniq
  end

  def ballots
    self.participants.map do |user|
      self.rankings.where(user_id: user.id).map(&:value)
    end
  end

  def schulze_ranks
    vs = SchulzeBasic.do self.ballots, self.solutions.length
    vs.ranks
  end

end