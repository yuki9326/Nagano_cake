class AddCreatedAtToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :created_at, :datetime
  end
end
