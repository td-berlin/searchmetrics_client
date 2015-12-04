require 'spec_helper'

describe SearchmetricsClient::Configuration do
  context 'default options' do
    include_context 'with api credentials'

    it 'api version' do
      expect(SearchmetricsClient.configuration.api_version)
        .to eq(SearchmetricsClient::API_DEFAULT_VERSION)
    end

    it 'api url' do
      expect(SearchmetricsClient.configuration.api_base_url)
        .to eq(SearchmetricsClient::API_BASE_URL)
    end
  end
end
