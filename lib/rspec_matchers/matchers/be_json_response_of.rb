require "json"

RSpec::Matchers.define(:be_json_response_of) { |expected|
  match { |actual|
    @actual = begin
      JSON.parse(actual.body)
    rescue StandardError
      actual.body
    end
    @expected = JSON.parse(RspecMatchers.json_encoder.call(expected))
    @actual == @expected
  }

  diffable
  attr_reader :actual, :expected
}
