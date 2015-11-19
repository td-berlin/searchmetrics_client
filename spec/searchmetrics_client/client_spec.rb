require 'spec_helper'

describe SearchmetricsClient::Client, vcr: { cassette_name: 'searchmetrics',
                                             record: :new_episodes } do
  let(:url) { 'http://api.searchmetrics.com/v1/AdminStatusGetValueAvailableCredits.json' }

  context 'when api credentials are configured' do
    include_context 'with api credentials'

    it 'access metric with success' do
      expect(described_class.instance.get(url).code).to be_eql('200')
    end
  end
end
