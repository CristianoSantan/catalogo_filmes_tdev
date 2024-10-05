class AddStatusToMovie < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :status, :boolean, default: 1
  end
end
