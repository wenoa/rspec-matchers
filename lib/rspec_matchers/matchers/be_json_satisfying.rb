require "json"

RSpec::Matchers.define(:be_json_satisfying) {
  match { |actual|
    json = JSON.parse(actual.body)
    block_arg.call(json)
  }
}
