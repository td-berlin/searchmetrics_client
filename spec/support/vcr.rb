VCR.configure do |config|
  config.cassette_library_dir = 'spec/casettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('SEARCHMETRICS_KEY') do
    API_CONFIG[:searchmetrics][:api_key]
  end
  config.filter_sensitive_data('SEARCHMETRICS_SECRET') do
    API_CONFIG[:searchmetrics][:api_secret]
  end
end
