class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nationality
      t.date :birth_date
      t.references :favorite_genre, null: false, foreign_key: { to_table: :genre }

      t.timestamps
    end
  end
end
