require 'spec_helper'

describe SearchmetricsClient::Configuration do
  context 'default options' do
    it 'api version' do
      expect(SearchmetricsClient.configuration.api_version)
        .to eq(SearchmetricsClient::API_DEFAULT_VERSION)
    end

    it 'api url' do
      expect(SearchmetricsClient.configuration.api_url)
        .to eq(File.join(SearchmetricsClient::API_BASE_URL,
                         SearchmetricsClient::API_DEFAULT_VERSION))
    end
  end
end
