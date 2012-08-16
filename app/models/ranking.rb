class Ranking < ActiveRecord::Base

  attr_accessible :solution_id, :user_id, :value

  belongs_to :user
  belongs_to :solution
  has_one :discussion, through: :solution

  validates :value, presence: true


  def self.save_rankings(params)
    number_of_options = params[:vote].length

    params[:vote].each_with_index.map do |solution_id, index|
      ranking = Ranking.find_or_create_by_solution_id_and_user_id solution_id: solution_id, user_id: params[:user_id]
      ranking.update_attributes value: (number_of_options - index)
    end
    # to refactor later: make a hash with solution_id's and rankings instead of passing around the fragile array indices
  end

end
