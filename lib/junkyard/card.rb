module Junkyard
  class Card
    attr_reader :name, :block

    def initialize options
      @name  = options[:name]
      @block = options[:block]
    end

    def is_a? card
      self.class.extract_name(card) == name
    end

    def self.extract_name val
      if val.class == self.class
        val.name
      elsif val.is_a?(Symbol)
        val
      else
        nil
      end
    end
  end
end
