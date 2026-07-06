module Movies
  class MovieCast < ApplicationRecord
    self.table_name = "movies_movie_casts"

    belongs_to :movie, inverse_of: :movie_casts, class_name: "Movies::Movie"
    belongs_to :cast, inverse_of: :movie_casts, class_name: "Movies::Cast"
  end
end
