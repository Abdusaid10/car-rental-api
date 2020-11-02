module Routes
  class FormatConstraints
    attr_reader :formats

    def initialize(formats)
      @formats = Array(formats)
    end

    def matches?(request)
      formats.include?(request.format.symbol)
    end
  end
end