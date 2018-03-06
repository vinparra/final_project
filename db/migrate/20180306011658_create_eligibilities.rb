class CreateEligibilities < ActiveRecord::Migration
  def change
    create_table :eligibilities do |t|
      t.integer :player_id
      t.integer :position_id

      t.timestamps

    end
  end
end
