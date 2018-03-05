class CreateHistoricals < ActiveRecord::Migration
  def change
    create_table :historicals do |t|
      t.integer :player_id
      t.string :source
      t.integer :year
      t.integer :ab
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.integer :runs
      t.float :avg
      t.float :innings_pitched
      t.integer :wins
      t.integer :saves
      t.float :era
      t.float :whip
      t.integer :strikeouts

      t.timestamps

    end
  end
end
