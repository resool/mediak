class CreateMovieDirectors < ActiveRecord::Migration[8.1]
  def change
    create_table :movies_directors do |t|
      t.string :name, null: false
      t.string :external_url

      t.timestamps
    end
  end
end
