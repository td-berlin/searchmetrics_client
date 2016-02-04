require 'forwardable'
require 'multi_json'

module SearchmetricsClient # :nodoc:
  class Response # :nodoc:
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
      @raw_response.status
    end
  end
end
