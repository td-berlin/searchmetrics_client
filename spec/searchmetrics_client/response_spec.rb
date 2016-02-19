require 'spec_helper'

describe SearchmetricsClient::Response, vcr: { cassette_name: 'searchmetrics',
                                               record: :new_episodes } do
  context 'when api credentials are configured' do
    include_context 'with api credentials'

    before :all do
      VCR.use_cassette('searchmetrics') do
        @response ||= SearchmetricsClient::Request.send_request_from_hash(
          endpoint: 'ResearchLinksGetListLinktext',
          params: { url: 'example.url' }
        )
      end
    end

    # Memoize response to avoid errors
    # "Insufficient credits to make this service request."
    # rubocop:disable Style/GlobalVars
    let(:response) { @response }

    describe 'response' do
      it 'returns response when request is correct' do
        expect(response).to be_kind_of(described_class)
      end

      it 'return hash data' do
        expect(response.value).to be_instance_of Hash
        expect(response.value).to eq(balance: 59_981)
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
