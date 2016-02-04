require 'spec_helper'

describe SearchmetricsClient::Response, vcr: { cassette_name: 'searchmetrics',
                                               record: :new_episodes } do
  let(:response) do
    SearchmetricsClient::Request.send_request_from_hash(
      endpoint: 'ResearchLinksGetListLinktext', params: { url: 'example.url' }
    )
  end

  context 'when api credentials are configured' do
    include_context 'with api credentials'

    describe '#value' do
      it 'return hash data' do
        expect(response.value).to be_instance_of Hash
        expect(response.value).to eq({ balance: 59981 })
      end
    end

    describe '#status' do
      it 'has valid status code' do
        expect(response.status). to eql(200)
      end
    end

    describe '#request' do
      it 'keeps reference to request' do
        expect(response.request).to be_instance_of SearchmetricsClient::Request
      end
    end
  end
end
