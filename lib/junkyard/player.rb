module Junkyard
  class Player
    attr_accessor :name, :health, :hand

    def initialize options
      @name   = options[:name]
      @health = 10
      @hand   = Hand.new
    end
  end
end
