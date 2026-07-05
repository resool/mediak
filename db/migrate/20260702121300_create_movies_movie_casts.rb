class CreateMoviesMovieCasts < ActiveRecord::Migration[8.1]
  def change
    create_table :movies_movie_casts do |t|
      t.references :movie, null: false, foreign_key: { to_table: :movies_movies }
      t.references :movie_cast, null: false, foreign_key: { to_table: :movies_casts }

      t.timestamps
    end
  end
end
