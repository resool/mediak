class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies_movies do |t|
      t.string :title_pl
      t.string :title_original, null: false
      t.integer :yor, null: false
      t.references :movie_director, null: false, foreign_key: { to_table: :movies_directors }
      t.string :external_url

      t.timestamps
    end
  end
end
