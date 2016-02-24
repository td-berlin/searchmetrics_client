require 'searchmetrics_client/version'

require 'searchmetrics_client/client'
require 'searchmetrics_client/configuration'
require 'searchmetrics_client/errors'
require 'searchmetrics_client/query'
require 'searchmetrics_client/request'
require 'searchmetrics_client/response'

module SearchmetricsClient
  API_DEFAULT_VERSION = 'v3'.freeze
  API_BASE_URL = 'http://api.searchmetrics.com'.freeze
end
