module SearchmetricsClient
  module Errors
    class ApiCredentialsNotProvided < StandardError
      def message
        'You have to configure SearchmetricsClient first.'
      end
    end

    class ApiRequestError < StandardError
      def initialize(msg, response)
        @response = response
        super(msg)
      end
    end

    class WrongMethodError < StandardError
      def message
        'Cannot determine HTTP method from endpoint name'
      end
    end
  end
end
