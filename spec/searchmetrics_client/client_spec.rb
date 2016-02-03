require 'spec_helper'

describe SearchmetricsClient::Client, vcr: { cassette_name: 'searchmetrics',
                                             record: :new_episodes } do
  include_context 'with api credentials'

  context 'AdminStatusGetValueAvailableCredits' do
    let(:url) do
      File.join(SearchmetricsClient::API_BASE_URL,
                api_version,
                'AdminStatusGetValueAvailableCredits.json')
    end

    context 'when api credentials are configured' do
      include_context 'with api credentials'

      it 'access metric with success' do
        expect(described_class.instance.get(url).status).to be_eql(200)
      end
    end
  end

  context 'AdminStatusGetListProjects' do
    context 'when api credentials are configured' do
      # http://api.searchmetrics.com/v3/documentation/api-calls/service/AdminStatusGetListProjects
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
