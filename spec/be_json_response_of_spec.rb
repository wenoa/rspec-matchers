RSpec.describe("be_json_response_of") {
  it("passes when the body matches the expected JSON") {
    response = FakeResponse.new(body: '{"id":1,"name":"Ana"}')

    expect(response).to(be_json_response_of({ id: 1, name: "Ana" }))
  }

  it("fails when the body is not valid JSON") {
    response = FakeResponse.new(body: "not json")

    expect(response).not_to(be_json_response_of({ id: 1 }))
  }

  it("exposes actual and expected for the diff") {
    matcher = be_json_response_of({ id: 1 })
    matcher.matches?(FakeResponse.new(body: '{"id":2}'))

    expect(matcher.actual).to(eq("id" => 2))
    expect(matcher.expected).to(eq("id" => 1))
  }
}
