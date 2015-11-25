# SearchmetricsClient

[![Build Status](https://travis-ci.org/td-berlin/searchmetrics_client.svg)](https://travis-ci.org/td-berlin/searchmetrics_client)

A thin abstraction over the [searchmetrics API](http://api.searchmetrics.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'searchmetrics_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install searchmetrics_client

## Configuration

To start using gem you have to configure API keys as bellow:

```ruby
SearchmetricsClient.configure do |config|
  config.api_key    = 'Your api key'
  config.api_secret = 'Your api secret'
end
```

Additionally you can specify `api_version` and `api_url`, which defaults to
`v1` and `http://api.searchmetrics.com` regardless.

## Usage

To get metric from Searchmetrics server use:

```ruby
SearchmetricsClient::Request.send_request_from_hash(
  endpoint: 'ResearchKeywordsGetListKeywordinfo',
  params: { countrycode: 'PL',
            keyword: 'ruby' }
)
```

Key `endpoint` is required.

`SearchmetricsClient::Response` object will be returned.

Exemplary call:

```ruby
response = SearchmetricsClient::Request.send_request_from_hash(
             endpoint: 'ResearchKeywordsGetListKeywordinfo',
             params: { countrycode: 'DE', keyword: 'ruby' }
           )
```

Returned value can be accessed by `#value` method:

```ruby
response.value
```

Response will look like:

```ruby
[{
  :cpc=>"2.37", :competition=>"3", :search_volume=>"12366",
  :trend=>"81:100:100:81:81:81:81:66:81:81:81:81",
  :ad_budget=>"29307.419999999998", :integration=>"images",
  :advertiser_count=>"0", :keyword=>"ruby", :year_month=>"201510"
}]
```

`#endpoint` returns requested type:

```ruby
response.endpoint # => "ResearchKeywordsGetListKeywordinfo"
```

`#url` returns requested url:

```ruby
response.url # => "http://api.searchmetrics.com/v1/ResearchKeywordsGetListKeywordinfo.json?countrycode=DE&keyword=ruby"
```

Access to raw response is available by methods `#header` and `#body`.


## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/searchmetrics_client. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
