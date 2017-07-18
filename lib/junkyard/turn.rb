module Junkyard
  # TODO
  class Turn
    attr_reader :game, :moves

    def initialize(game, player)
      @moves = [Move.new(self, player)]
      @game  = game

      @moves.last.begin
    end

    def player
      @moves.first.player
    end

    def move
      @moves.last
    end

    def begin
      player.observers.each do |observer|
        observer.execute :before_turn, self
      end
    end

    def next_move(player)
      @moves << Move.new(self, player)
    end
  end
end
