class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :player_id
      t.string :comment

      t.timestamps

    end
  end
end
