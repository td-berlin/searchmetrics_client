$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'searchmetrics_client'
require 'vcr'

spec_root = File.expand_path('../', __FILE__)
Dir[File.join(spec_root, 'support/**/*.rb')].each { |f| require f }
