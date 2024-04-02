class RenameColmunInMovies < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :movies, column: :genrer_id
    rename_column :movies, :genrer_id, :genre_id
    add_foreign_key :movies, :genres, column: :genre_id
  end
end