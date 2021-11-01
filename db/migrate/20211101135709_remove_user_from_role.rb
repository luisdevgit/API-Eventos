class RemoveUserFromRole < ActiveRecord::Migration[6.1]
  def change
    remove_reference :roles, :user, null: false, foreign_key: true
  end
end
