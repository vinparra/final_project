class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :player_id
      t.string :source
      t.integer :overall_rank
      t.integer :position_rank
      t.integer :dollar_value
      t.integer :rank_best
      t.string :rank_worst
      t.float :rank_average
      t.float :rank_std_dev
      t.integer :avg_draft_position

      t.timestamps

    end
  end
end
