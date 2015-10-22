require_relative '../lib/junkyard'
require_relative '../lib/junkyard/game/default'

# make the error logs prettier
module Junkyard
  class Player
    def inspect
      [name, ' (health: ', health, ',', ' cards: [', hand.map { |card| card.name }.join(', '), '])'].join
    end
  end
end
