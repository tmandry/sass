module Sass::Script
  # A SassScript value that will resolve to the current selector.
  class Selector < Node
    def initialize; end

    def children; []; end

    def to_sass(opts = {}); '&'; end

    def deep_copy; self.dup; end

    protected

    def _perform(environment)
      return opts(Sass::Script::Null.new) unless selector = environment.selector
      opts(Sass::Script::List.new(selector.members.map do |seq|
        Sass::Script::List.new(seq.members.map do |component|
          Sass::Script::String.new(component.to_s)
        end, :space)
      end, :comma))
    end
  end
end
