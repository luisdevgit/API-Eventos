class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :seat
      t.string :name
      t.decimal :price
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
