class AddStatusToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :status, :boolean
  end
end
