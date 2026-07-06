require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [ :method, :uri, :body ],
    decode_compressed_response: true
  }
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true

  config.filter_sensitive_data('<TMDB_API_KEY>') { Settings.movies.tmdb.api_key }

  config.before_record do |interaction|
    interaction.response.body.force_encoding('UTF-8')
  end
end
