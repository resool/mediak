module Movies
  class Director < ApplicationRecord
    self.table_name = "movies_directors"

    has_many :movies, dependent: :restrict_with_exception, inverse_of: :director, class_name: "Movies::Movie"
  end
end
