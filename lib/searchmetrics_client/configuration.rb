module SearchmetricsClient
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :api_secret, :api_version, :api_url

    def initialize
      @api_version = 'v1'
      @api_url     = 'http://api.searchmetrics.com'
    end
  end
end
