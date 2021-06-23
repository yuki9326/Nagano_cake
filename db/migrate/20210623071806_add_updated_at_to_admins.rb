class AddUpdatedAtToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :updated_at, :datetime
  end
end
