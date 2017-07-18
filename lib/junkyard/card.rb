module Junkyard
  # Card objects that build the card array in the hand.
  class Card
    attr_reader :name, :block

    def initialize(options)
      @name  = options[:name]
      @block = options[:block]
    end

    def is_a?(card)
      self.class.extract_name(card) == name
    end

    def self.extract_name(val)
      if val.class == self.class
        val.name
      elsif val.is_a?(Symbol)
        val
      end
    end

    def attach_to(target, &block)
      target.observers << Observer.new(&block)
    end

    def detach_from(target)
      target.observers.delete self
    end
  end
end
