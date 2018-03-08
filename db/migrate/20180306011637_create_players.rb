class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :team_id
      t.integer :owner_id
      t.string :injury_status

      t.timestamps

    end
  end
end
