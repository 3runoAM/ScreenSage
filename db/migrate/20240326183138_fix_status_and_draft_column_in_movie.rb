class FixStatusAndDraftColumnInMovie < ActiveRecord::Migration[7.1]
  def change
    remove_columns :movies, :status, :draft
    add_column :movies, 'status', :integer, default: 1
    add_column :movies, 'draft', :integer, default: 1
  end
end
