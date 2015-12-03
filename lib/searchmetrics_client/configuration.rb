module SearchmetricsClient
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :api_secret, :api_version, :api_base_url, :api_url

    def initialize
      @api_version  = SearchmetricsClient::API_DEFAULT_VERSION
      @api_base_url = SearchmetricsClient::API_BASE_URL
      @api_url = File.join(@api_base_url, @api_version)
    end
  end
end
