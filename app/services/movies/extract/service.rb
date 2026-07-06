module Movies
  module Extract
    class Service
      DEFAULT_EXTRACT_STRATEGY = 'Movies::Extract::Strategies::Largest'

      def initialize(iso_path:, extract_strategy: DEFAULT_EXTRACT_STRATEGY)
        @iso_path = iso_path
        @extract_strategy = extract_strategy
      end

      def call
        @call ||= result
      end

      private

      attr_reader :iso_path, :extract_strategy

      def result
        create_temp_dir
        stdout, stderr, status = extract_iso
        raise "MakeMKV failed: #{stderr}" unless status.success?
      
        chosen_media
      end

      def create_temp_dir
        FileUtils.mkdir_p(output_dir)
      end

      def extract_iso
        Open3.capture3(
          "makemkvcon", "mkv", "iso:#{iso_path}", "all", output_dir.to_s
        )
      end

      def output_dir
        @output_dir ||= Rails.root.join("tmp", "extraction", SecureRandom.uuid)
      end

      def chosen_media
        extract_strategy.constantize.new(directory: output_dir).call
      end
    end
  end
end
