module Movies
  module FetchMetadata
    class Serializer
      def initialize(result_array:, fetch_movie_strategy:)
        @result_array = result_array
        @fetch_movie_strategy = fetch_movie_strategy
      end

      def to_h
        @to_h ||= begin
          if chosen_movie.nil?
            {}
          else
            {
              title_pl: chosen_movie["title"],
              title_original: chosen_movie["original_title"],
              description: chosen_movie["overview"],
              external_id: chosen_movie_external_id,
              yob: chosen_movie["release_date"].to_date.year,
              external_ids_candidates: external_ids_candidates
            }
          end
        end
      end

      private

      attr_reader :fetch_movie_strategy, :result_array

      def chosen_movie_external_id
        @chosen_movie_external_id ||= chosen_movie["id"]
      end

      def chosen_movie
        @chosen_movie ||= fetch_movie_strategy.new(collection: result_array).call
      end

      def external_ids_candidates
        result_array.reject { |result| result["id"] == chosen_movie_external_id }.map { |result| result["id"] }
      end
    end
  end
end
