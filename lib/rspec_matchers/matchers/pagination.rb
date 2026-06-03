require "json"

RSpec::Matchers.define(:be_a_page_with) { |*expected_items|
  match { |response|
    @expected = JSON.parse(RspecMatchers.json_encoder.call(expected_items))
    @actual = begin
      JSON.parse(response.body)
    rescue StandardError
      response.body
    end
    @actual_status = response.status
    @actual_total = response.headers["Total-Items"].to_i

    valid_status? && valid_total? && valid_content?
  }

  chain(:out_of) { |expected_total| @expected_total = expected_total }

  failure_message {
    [
      ("Expected status code 200, but got #{@actual_status}" unless valid_status?),
      ("Expected total of items #{@expected_total}, but got #{@actual_total}" unless valid_total?),
      ("Page content is invalid" unless valid_content?),
    ].compact.join("\n")
  }

  diffable
  attr_reader :actual, :expected

  def valid_status?
    @actual_status == 200
  end

  def valid_total?
    @actual_total == @expected_total
  end

  def valid_content?
    @actual == @expected &&
      RspecMatchers.json_encoder.call(@actual) == RspecMatchers.json_encoder.call(@expected)
  end
}
