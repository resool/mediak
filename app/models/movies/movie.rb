module Movies
  class Movie < ApplicationRecord
    self.table_name = "movies_movies"

    belongs_to :director, inverse_of: :movies, class_name: "Movies::Director"
    has_many :movie_casts, dependent: :destroy, inverse_of: :movie, class_name: "Movies::MovieCast"
    has_many :casts, through: :movie_casts, class_name: "Movies::Cast", inverse_of: :movies
  end
end
