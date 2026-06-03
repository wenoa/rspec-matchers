RSpec.describe("be_json_satisfying") {
  let(:response) { FakeResponse.new(body: '{"value":123}') }

  it("passes when the block returns true") {
    expect(response).to(be_json_satisfying { |json| json.key?("value") })
  }

  it("fails when the block returns false") {
    expect(response).not_to(be_json_satisfying { |json| json.key?("missing") })
  }
}
