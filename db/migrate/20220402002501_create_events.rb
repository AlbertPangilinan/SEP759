class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
