RSpec.describe(RspecMatchers) {
  describe(".json_encoder") {
    it("returns the configured encoder") {
      encoder = ->(object) { JSON.generate(object) }
      described_class.json_encoder = encoder

      expect(described_class.json_encoder).to(be(encoder))
    }

    it("raises when no encoder is configured") {
      described_class.json_encoder = nil

      expect { described_class.json_encoder }.to(raise_error(RspecMatchers::Error, /not configured/))
    }
  }
}
