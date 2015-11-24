RSpec.shared_context 'with api credentials' do
  let(:api_key) { 'Your api key' }
  let(:api_secret) { 'Your api secret' }
  before(:each) do
    SearchmetricsClient.configure do |config|
      config.api_key    = api_key
      config.api_secret = api_secret
    end
  end
end
