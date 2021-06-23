class AddIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :id, :integer
  end
end
