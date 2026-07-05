module Movies
  class Cast < ApplicationRecord
    self.table_name = 'movies_casts'

    has_many :movie_casts, dependent: :restrict_with_exception, inverse_of: :cast, class_name: 'Movies::MovieCast'
    has_many :movies, through: :movie_casts, class_name: 'Movies::Movie', inverse_of: :casts
  end
end
