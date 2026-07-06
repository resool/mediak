module Movies
  module Extract
    module Strategies
      class Largest
        def initialize(directory:)
          @directory = directory
        end

        def call
          Dir.glob("#{directory}/*.mkv").max_by { |f| File.size(f) }
        end

        private

        attr_reader :directory
      end
    end
  end
end
