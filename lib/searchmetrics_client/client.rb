require 'oauth'
require 'oauth2'
require 'singleton'
require 'forwardable'

module SearchmetricsClient
  class Client
    include Singleton
    extend Forwardable

    def_delegators :access_token, :get, :post

    # Memoize for each API versions
    def access_token
      method = "access_token_api_#{SearchmetricsClient.configuration.api_version}"
      @access_tokens ||= Hash.new do |h, key|
        h[key] = send(key)
      end
      @access_tokens[method]
    end

    private

    def api_url
      File.join(SearchmetricsClient.configuration.api_base_url,
                SearchmetricsClient.configuration.api_version)
    end

    def access_token_api_v1
      consumer = OAuth::Consumer.new(SearchmetricsClient.configuration.api_key,
                                     SearchmetricsClient.configuration.api_secret,
                                     site: SearchmetricsClient.configuration.api_base_url)
      OAuth::AccessToken.from_hash(consumer, oauth_token: '', oauth_token_secret: '')
    end

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
