module SearchmetricsClient
  class Query # :nodoc:
    attr_accessor :query, :endpoint, :params

    def self.from_hash(hash)
      endpoint = hash.fetch(:endpoint)
      params   = hash.fetch(:params, {})
      new(endpoint, params)
    end

    def initialize(endpoint, params = {})
      @endpoint = endpoint
      @params   = params
      @query    = build_query
    end

    def to_h
      hash = { endpoint: endpoint }
      hash[:params] = params unless params.empty?
      hash
    end

    private

    def build_query
      params_string = build_params unless params.empty?
      "#{endpoint}.json#{params_string}"
    end

    def build_params
      params_string = params.map do |k, v|
        v = v.map(&:to_s).join(',') if v.is_a? Array
        "#{k}=#{v}"
      end.join('&')
      "?#{params_string}"
    end
  end
end
