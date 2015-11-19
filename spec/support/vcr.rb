VCR.configure do |config|
  config.cassette_library_dir = 'spec/casettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
