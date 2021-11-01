class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
