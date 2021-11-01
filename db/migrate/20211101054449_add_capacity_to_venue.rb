class AddCapacityToVenue < ActiveRecord::Migration[6.1]
  def change
    add_column :venues, :capacity, :integer
  end
end
