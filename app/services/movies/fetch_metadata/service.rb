module Movies
  module FetchMetadata  
    class Service
      DEFAULT_FETCH_MOVIE_STRATEGY = 'Movies::FetchMetadata::Strategies::First'

      def initialize(title:, year:, fetch_movie_strategy: DEFAULT_FETCH_MOVIE_STRATEGY)
        @title = title
        @year = year
        @fetch_movie_strategy = fetch_movie_strategy
      end

      def call
        serialized_result
      end

      attr_reader :title, :year, :fetch_movie_strategy

      private

      def serialized_result
        @serialized_result ||= Serializer.new(
          result_array: search_results,
          fetch_movie_strategy: fetch_movie_strategy.constantize
        ).to_h
      end

      def search_results
        search = Tmdb::Search.new
        search.resource('movie')
        search.query(title)
        search.primary_release_year(year)
        search.fetch
      end
    end
  end
end