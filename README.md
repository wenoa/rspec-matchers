# RSpec Matchers

## Usage

```ruby
gem "rspec_matchers", github: "wenoa/rspec-matchers", group: :test
```

In `spec_helper.rb`:

```ruby
require "rspec_matchers"

RspecMatchers.json_encoder = ->(object) { ActiveSupport::JSON.encode(object) }
```

## Matchers

- `execute_in_less_than(seconds)` — the block runs in less than the given time.
- `be_json_response_of(expected)` — the response body matches the expected JSON.
- `be_json_satisfying { |json| ... }` — the parsed response body satisfies the block.
- `be_uri_encoded_json_of(expected)` — the URL-encoded string matches the expected JSON.
- `be_a_page_with(*items).out_of(total)` — paginated response: status `200`, content and `Total-Items` header.

The JSON matchers require `RspecMatchers.json_encoder` (a callable returning a JSON string) to be configured.
