class Discussion < ActiveRecord::Base
  attr_accessible :question
  belongs_to :user
  has_many :solutions
  has_many :user_discussions
  has_many :rankings, through: :solutions

  validates :question, presence: true

  def voted_on?
    !self.rankings.empty?
  end

  def results
    ranks.map do |rank|
      self.solutions[("A".."Z").to_a.index( rank[0] )]
    end
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
      user.rankings.select {|ranking| ranking.discussion == self}.sort_by(&:id).reverse.map(&:value)
    end
  end

  def ranks
    vs = SchulzeBasic.do self.ballots, self.solutions.length
    vs.ranks_abc
  end

end