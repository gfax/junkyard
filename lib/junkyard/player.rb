module Junkyard
  class Player
    attr_accessor :name, :health

    def initialize options
      @name   = options[:name]
      @health = 10
    end
  end
end
