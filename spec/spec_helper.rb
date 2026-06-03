require "simplecov"
require "simplecov-console"

if ENV["COVERAGE"]
  SimpleCov.start {
    enable_coverage :branch
    add_filter "/spec/"
  }
end

require "json"
require_relative "../lib/rspec_matchers"
require_relative "support/fake_response"

RSpec.configure { |config|
  config.before {
    RspecMatchers.json_encoder = ->(object) { JSON.generate(object) }
  }
}
