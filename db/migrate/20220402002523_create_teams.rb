class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :abbrev, :limit => 4
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
