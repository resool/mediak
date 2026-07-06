module Movies
  module Extract
    module Strategies
      class Largest
        def initialize(collection:)
          @collection = collection
        end

        def call
          collection.max_by { |f| File.size(f) }
        end

        private

        attr_reader :collection
      end
    end
  end
end
