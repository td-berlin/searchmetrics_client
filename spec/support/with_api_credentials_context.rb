RSpec.shared_context 'with api credentials' do
  let(:api_config) do
    YAML.load_file(File.join(SPEC_ROOT, 'searchmetrics_config.yml'))
  end
  let(:api_key) { api_config[:searchmetrics][:api_key] }
  let(:api_secret) { api_config[:searchmetrics][:api_secret] }

  before(:each) do
    SearchmetricsClient.configure do |config|
      config.api_key    = api_key
      config.api_secret = api_secret
    end
  end
end
