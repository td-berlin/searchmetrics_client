require 'oauth'
require 'singleton'
require 'forwardable'

module SearchmetricsClient
  class Client
    include Singleton
    extend Forwardable

    def_delegators :access_token, :get, :post

    private

    def access_token
      @access_token ||= generate_access_token
    end

    def generate_access_token
      consumer = OAuth::Consumer.new(SearchmetricsClient.configuration.api_key,
                                     SearchmetricsClient.configuration.api_secret,
                                     site: SearchmetricsClient.configuration.api_base_url)
      OAuth::AccessToken.from_hash(consumer, oauth_token: '', oauth_token_secret: '')
    end
  end
end
