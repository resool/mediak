module Movies
  module FetchMetadata
    module Strategies
      class First
        def initialize(collection:)
          @collection = collection
        end

        def call
          collection.first
        end

        private

        attr_reader :collection
      end
    end
  end
end
