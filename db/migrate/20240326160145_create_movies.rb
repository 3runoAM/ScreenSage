class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.string :plot
      t.string :origin_country
      t.references :director, null: false, foreign_key: true
      t.references :genrer, null: false, foreign_key: true
      t.boolean :status
      t.boolean :draft

      t.timestamps
    end
  end
end
