class Discussion < ActiveRecord::Base
  attr_accessible :question, :votable
  belongs_to :user
  has_many :solutions
  has_many :user_discussions
  has_many :rankings, through: :solutions

  validates :question, presence: true
  accepts_nested_attributes_for :solutions

  def voted_on?
    !self.rankings.empty?
  end

  def results
    results = {}
    self.solutions.each do |sol|
      values = sol.rankings.map{ |r| r.value }
      sum = values.inject {|sum, value| sum + value }
      results[sol] = sum
    end
    arr = results.sort_by {|key, value| value}
    arr.map { |e| e[0] }.reverse


    # arr = ranks.map do |rank|
    #        self.solutions[("A".."Z").to_a.index( rank[0] )]
    #      end
    #      arr.reverse
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

  def votable?
    self.votable
  end

  def mark_votable
    self.update_attributes(votable: true)
  end

end