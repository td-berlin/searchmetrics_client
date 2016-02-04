require 'spec_helper'

describe SearchmetricsClient::Query do
  let(:query) do
    described_class.from_hash(endpoint: 'ResearchLinksGetListExampleKey')
  end
  let(:query_with_params) do
    described_class.from_hash(
      endpoint: 'ResearchLinksGetListExampleKey',
      params: { param1: 'value1', param2: %w(a b c d e) }
    )
  end
  let(:path) do
    'ResearchLinksGetListExampleKey.json?param1=value1&param2=a,b,c,d,e'
  end
  describe '#from_hash' do
    it 'requires :endpoint key' do
      expect { described_class.from_hash(params: { param1: 'val2' }) }
        .to raise_error(KeyError)
    end

    it 'builds query with params' do
      expect(query_with_params.query).to eql(path)
    end
  end

  describe '#to_h' do
    it 'converts query to hash' do
      expect(query_with_params.to_h).to eql(
        endpoint: 'ResearchLinksGetListExampleKey',
        params: {
          param1: 'value1',
          param2: %w(a b c d e)
        }
      )
    end
  end
end
