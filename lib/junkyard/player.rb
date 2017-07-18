module Junkyard
  # TODO
  class Player
    attr_accessor :name, :health, :hand, :observers

    def initialize(options)
      @name   = options[:name]
      @health = 10
      @hand   = Hand.new
      @observers = []
    end
  end
end
