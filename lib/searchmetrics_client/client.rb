require 'oauth2'
require 'singleton'
require 'forwardable'

module SearchmetricsClient
  class Client
    include Singleton
    extend Forwardable

    def_delegators :access_token, :get, :post

    def access_token
      @access_token ||= access_token_api_v3
    end

    private

    def api_url
      File.join(SearchmetricsClient.configuration.api_base_url,
                SearchmetricsClient.configuration.api_version)
    end

    # http://api.searchmetrics.com/v3/documentation/start
    def access_token_api_v3
      token_url = File.join(api_url, 'token')
      client = OAuth2::Client.new(SearchmetricsClient.configuration.api_key,
                                  SearchmetricsClient.configuration.api_secret,
                                  site: SearchmetricsClient.configuration.api_base_url,
                                  token_url: token_url,
                                  token_method: :post)
      client.client_credentials.get_token
    end
  end
end
