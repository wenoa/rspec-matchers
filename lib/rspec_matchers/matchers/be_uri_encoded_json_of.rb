require "json"
require "uri"

RSpec::Matchers.define(:be_uri_encoded_json_of) { |expected|
  match { |actual|
    @actual = JSON.parse(URI.decode_www_form_component(actual))
    @expected = JSON.parse(RspecMatchers.json_encoder.call(expected))
    @actual == @expected
  }

  diffable
  attr_reader :actual, :expected
}
