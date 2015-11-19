require 'forwardable'
require 'multi_json'

module SearchmetricsClient
  class Request
    attr_reader :url, :query, :response

    extend Forwardable
    def_delegator :query, :endpoint

    def self.send_request(query)
      new(query).send_request
    end

    def self.send_request_from_hash(hash)
      query = SearchmetricsClient::Query.from_hash(hash)
      SearchmetricsClient::Request.send_request(query)
    end

    def initialize(query)
      @query = query
      @url = build_url
    end

    def send_request
      check_credentials
      result = Client.instance.public_send(method, url)
      check_errors(result)
      @response = SearchmetricsClient::Response.new(self, result)
    end

    private

    def method
      return :get if endpoint =~ /Get/
      return :post if endpoint =~ /Post/
      fail SearchmetricsClient::Errors::WrongMethodError
    end

    def build_url
      [
        "#{SearchmetricsClient.configuration.api_url}/",
        "#{SearchmetricsClient.configuration.api_version}/",
        query.query
      ].join
    end

    def check_credentials
      fail SearchmetricsClient::Errors::ApiCredentialsNotProvided unless credentials_present?
    end

    def credentials_present?
      SearchmetricsClient.configuration.api_key && SearchmetricsClient.configuration.api_secret
    end

    def check_errors(result)
      return if result.code == '200'
      message = MultiJson.load(result.body, symbolize_keys: true)[:error_message]
      fail SearchmetricsClient::Errors::ApiRequestError.new(message, result)
    end
  end
end
