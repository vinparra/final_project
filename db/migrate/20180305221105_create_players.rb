class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :team_id
      t.integer :position_id
      t.integer :user_id

      t.timestamps

    end
  end
end
