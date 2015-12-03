$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'searchmetrics_client'
require 'vcr'

SPEC_ROOT = File.expand_path('../', __FILE__)
Dir[File.join(SPEC_ROOT, 'support/**/*.rb')].each { |f| require f }
