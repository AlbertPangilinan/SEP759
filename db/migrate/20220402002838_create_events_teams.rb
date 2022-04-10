class CreateEventsTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :events_teams, id: false do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
    end
  end
end
