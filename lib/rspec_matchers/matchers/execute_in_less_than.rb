RSpec::Matchers.define(:execute_in_less_than) { |expected_time|
  supports_block_expectations

  match { |block|
    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    block.call
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @elapsed = ending - starting
    @elapsed < expected_time
  }

  failure_message {
    "Expected block to execute in less than #{expected_time} seconds, but took #{@elapsed} seconds"
  }
}
