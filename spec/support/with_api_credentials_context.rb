RSpec.shared_context 'with api credentials' do
  let(:api_key) { API_CONFIG[:searchmetrics][:api_key] }
  let(:api_secret) { API_CONFIG[:searchmetrics][:api_secret] }
  let(:api_version) { SearchmetricsClient::API_DEFAULT_VERSION }

  before do
    SearchmetricsClient.configure do |config|
      config.api_key     = api_key
      config.api_secret  = api_secret
      config.api_version = api_version
    end
  end
end
