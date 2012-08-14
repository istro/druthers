class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :user
      t.references :solution
      t.integer :value

      t.timestamps
    end
  end
end
