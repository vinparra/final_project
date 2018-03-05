class CreateHistoricals < ActiveRecord::Migration
  def change
    create_table :historicals do |t|
      t.integer :player_id
      t.string :source
      t.integer :year
      t.integer :at_bats
      t.integer :home_runs
      t.integer :runs_batted_in
      t.integer :stolen_bases
      t.integer :runs
      t.float :avg
      t.float :innings_pitched
      t.integer :wins
      t.integer :saves
      t.float :era
      t.float :whip
      t.integer :strikeouts
      t.integer :hits
      t.float :on_base_percentage
      t.float :slugging_percentage
      t.float :on_base_plus_slugging

      t.timestamps

    end
  end
end
