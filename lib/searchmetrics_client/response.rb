require 'forwardable'
require 'multi_json'

module SearchmetricsClient
  class Response
    attr_reader :request

    extend Forwardable
    def_delegators :request, :endpoint, :query, :url
    def_delegators :@raw_response, :body, :header

    def initialize(request, raw_response)
      @request = request
      @raw_response = raw_response
    end

    def value
      @value ||= MultiJson.load(body, symbolize_keys: true)
    end

    def status
      result_status(@raw_response)
    end

    private

    # Handle both OAuth v1 and v2 Response object
    # v1 is returning `Net::HTTPOK`... objects
    # v2 is returning `OAuth::Response`
    def result_status(result)
      if result.respond_to?(:code)
        result.code.to_i
      else
        result.status
      end
    end
  end
end
