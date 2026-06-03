RSpec.describe("be_a_page_with") {
  it("passes for a page with the expected status, content and total") {
    response = FakeResponse.new(body: '[{"id":1}]', status: 200, headers: { "Total-Items" => 50 })

    expect(response).to(be_a_page_with({ "id" => 1 }).out_of(50))
  }

  it("reports a wrong status code") {
    response = FakeResponse.new(body: "[]", status: 404, headers: { "Total-Items" => 0 })
    matcher = be_a_page_with.out_of(0)

    expect(matcher.matches?(response)).to(be(false))
    expect(matcher.failure_message).to(eq("Expected status code 200, but got 404"))
  }

  it("reports a wrong total of items") {
    response = FakeResponse.new(body: "[]", status: 200, headers: { "Total-Items" => 5 })
    matcher = be_a_page_with.out_of(10)

    expect(matcher.matches?(response)).to(be(false))
    expect(matcher.failure_message).to(eq("Expected total of items 10, but got 5"))
  }

  it("reports invalid content when the body is not valid JSON") {
    response = FakeResponse.new(body: "not json", status: 200, headers: { "Total-Items" => 1 })
    matcher = be_a_page_with({ "id" => 1 }).out_of(1)

    expect(matcher.matches?(response)).to(be(false))
    expect(matcher.failure_message).to(eq("Page content is invalid"))
  }

  it("is diffable and exposes actual and expected") {
    response = FakeResponse.new(body: '[{"id":2}]', status: 200, headers: { "Total-Items" => 1 })
    matcher = be_a_page_with({ "id" => 1 }).out_of(1)
    matcher.matches?(response)

    expect(matcher.diffable?).to(be(true))
    expect(matcher.actual).to(eq([{ "id" => 2 }]))
    expect(matcher.expected).to(eq([{ "id" => 1 }]))
  }
}
