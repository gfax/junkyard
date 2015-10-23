module Junkyard
  class Turn
    attr_reader :game, :moves

    def initialize game, player
      @moves = [Move.new(self, player)]
      @game  = game
    end

    def player
      @moves.first.player
    end

    def move
      @moves.last
    end

    def next_move player
      @moves << Move.new(self, player)
    end
  end
end
