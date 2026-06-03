module RspecMatchers
  class Error < StandardError; end

  class << self
    # A callable that receives an object and returns its JSON string
    # representation. The gem ships no default: configure it globally, e.g.
    #
    #   RspecMatchers.json_encoder = ->(object) { ActiveSupport::JSON.encode(object) }
    attr_writer :json_encoder

    def json_encoder
      return @json_encoder if @json_encoder

      raise(Error, "RspecMatchers.json_encoder is not configured. Set it globally, e.g. `RspecMatchers.json_encoder = ->(object) { ActiveSupport::JSON.encode(object) }`.")
    end
  end
end
