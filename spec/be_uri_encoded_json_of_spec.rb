RSpec.describe("be_uri_encoded_json_of") {
  it("passes when the URL-encoded string matches the expected JSON") {
    encoded = URI.encode_www_form_component('{"from":"2024-01-01"}')

    expect(encoded).to(be_uri_encoded_json_of({ from: "2024-01-01" }))
  }

  it("fails when it does not match") {
    encoded = URI.encode_www_form_component('{"from":"2024-01-01"}')

    expect(encoded).not_to(be_uri_encoded_json_of({ to: "2024-12-31" }))
  }

  it("exposes actual and expected for the diff") {
    matcher = be_uri_encoded_json_of({ from: "2024-01-01" })
    matcher.matches?(URI.encode_www_form_component('{"from":"2023-01-01"}'))

    expect(matcher.actual).to(eq("from" => "2023-01-01"))
    expect(matcher.expected).to(eq("from" => "2024-01-01"))
  }
}
