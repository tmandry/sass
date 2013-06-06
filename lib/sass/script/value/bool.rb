module Sass::Script::Value
  # A SassScript object representing a boolean (true or false) value.
  class Bool < Base

    TRUE  = self.new(true)
    FALSE = self.new(false)

    # Get a Sass boolean value without constructing a new boolean object.
    #
    # @param value A ruby value that will be tested for truthiness.
    #
    # @return [Bool] TRUE if value is truthy, FALSE if value is falsey
    def self.from(value)
      value ? TRUE : FALSE
    end

    # The Ruby value of the boolean.
    #
    # @return [Boolean]
    attr_reader :value
    alias_method :to_bool, :value

    # @return [String] "true" or "false"
    def to_s(opts = {})
      @value.to_s
    end
    alias_method :to_sass, :to_s
  end

  # Convenient alias for [Bool.from]
  def self.Bool(value)
    Bool.from(value)
  end

end
