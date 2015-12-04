require 'spec_helper'

describe SearchmetricsClient::Client, vcr: { cassette_name: 'searchmetrics',
                                             record: :new_episodes } do
  context 'v1' do
    let(:url) do
      File.join(SearchmetricsClient::API_BASE_URL,
                api_version,
                'AdminStatusGetValueAvailableCredits.json')
    end

    context 'when api credentials are configured' do
      include_context 'with api credentials'

      it 'access metric with success' do
        expect(described_class.instance.get(url).code).to be_eql('200')
      end
    end
  end

  context 'v3' do
    context 'when api credentials are configured' do
      include_context 'with api credentials' do
        let(:api_version) { 'v3' }
      end

      after do
        SearchmetricsClient.configuration.api_version = SearchmetricsClient::API_DEFAULT_VERSION
      end

      let(:url) do
        File.join(SearchmetricsClient::API_BASE_URL,
                  api_version,
                  'AdminStatusGetListProjects.json')
      end

      it 'access metric with success' do
        expect(described_class.instance.get(url).status).to be_eql(200)
      end
    end
  end
end
