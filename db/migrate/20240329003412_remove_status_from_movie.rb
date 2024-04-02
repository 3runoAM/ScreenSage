class RemoveStatusFromMovie < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :status, :integer
  end
end
