module Junkyard
  class Observer
    attr_reader :callbacks

    def initialize &block
      @callbacks = { before: {}, after: {} }

      instance_exec &block
    end

    def execute action, context
      callbacks = action.to_s.split('_').inject(@callbacks) { |cb, k| cb[k.to_sym] }
      callbacks = callbacks[nil] if callbacks.is_a?(Hash)

      callbacks.each do |block|
        context.instance_exec &block
      end
    end

    def before action = nil, &block
      callbacks[:before][action] ||= []
      callbacks[:before][action] << block
    end

    def after action = nil, &block
      callbacks[:after][action] ||= []
      callbacks[:after][action] << block
    end
  end
end
