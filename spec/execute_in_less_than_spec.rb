RSpec.describe("execute_in_less_than") {
  it("passes when the block runs in less than the given time") {
    expect { 1 + 1 }.to(execute_in_less_than(5))
  }

  it("fails reporting the elapsed time") {
    expect {
      expect { 1 + 1 }.to(execute_in_less_than(0))
    }.to(raise_error(RSpec::Expectations::ExpectationNotMetError, /Expected block to execute in less than 0 seconds/))
  }
}
