require 'spec_helper'

describe SearchmetricsClient::Request, vcr: { cassette_name: 'searchmetrics',
                                              record: :new_episodes } do
  context 'APIv3' do
    let(:url) do
      File.join(SearchmetricsClient::API_BASE_URL,
                api_version,
                'AdminStatusGetValueAvailableCredits.json')
    end
    let(:query) do
      SearchmetricsClient::Query.from_hash(
        endpoint: 'ResearchLinksGetListLinktext',
        params: { url: 'searchmetrics.com' }
      )
    end
    let(:wrong_params_query) do
      SearchmetricsClient::Query.from_hash(
        endpoint: 'ResearchLinksGetListLinktext'
      )
    end
    let(:wrong_endpoint_method_query) do
      SearchmetricsClient::Query.from_hash(endpoint: 't')
    end
    let(:wrong_endpoint_query) do
      SearchmetricsClient::Query.from_hash(
        endpoint: 'ResearchLinksGetListLinktex'
      )
    end

    context 'when api credentials are configured' do
      include_context 'with api credentials'

      describe '#send_request' do
        it 'returns response when request is correct' do
          expect(described_class.send_request(query))
            .to be_kind_of(SearchmetricsClient::Response)
        end

        context 'when request is not correct' do
          it 'fail with error when no HTTP method found' do
            expect do
              described_class.send_request(wrong_endpoint_method_query)
            end.to raise_error(SearchmetricsClient::Errors::WrongMethodError)
          end

          it 'fail with error on wrong endpoint' do
            expect { described_class.send_request(wrong_params_query) }.to(
              raise_error(SearchmetricsClient::Errors::ApiRequestError,
                          'For service "ResearchLinksGetListLinktext" ' \
                          'parameter "url" is required!')
            )
            expect { described_class.send_request(wrong_endpoint_query) }.to(
              raise_error(SearchmetricsClient::Errors::ApiRequestError,
                          'Unknown Service "ResearchLinksGetListLinktex"')
            )
          end
        end
      end
    end
  end
end
