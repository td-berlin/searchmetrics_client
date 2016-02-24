require 'spec_helper'

describe SearchmetricsClient::Response, vcr: { cassette_name: 'searchmetrics',
                                               record: :new_episodes } do
  context 'when api credentials are configured' do
    include_context 'with api credentials'

    let(:response) do
      SearchmetricsClient::Request.send_request_from_hash(
        endpoint: 'ResearchLinksGetListLinktext',
        params: { url: 'searchmetrics.com' }
      )
    end

    describe 'response' do
      it 'returns response when request is correct' do
        expect(response).to be_kind_of(described_class)
      end

      it 'return hash data' do
        expect(response.value).to be_instance_of Hash
      end

      it 'return array of values' do
        expect(response.value[:response]).to be_kind_of(Array)
      end

      it 'has valid status code' do
        expect(response.status). to eql(200)
      end

      it 'keeps reference to request' do
        expect(response.request).to be_instance_of(SearchmetricsClient::Request)
      end
    end
  end
end
