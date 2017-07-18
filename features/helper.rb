require 'coveralls'
Coveralls.wear!

require_relative '../lib/junkyard'
require_relative '../lib/junkyard/game/default'

# make the error logs prettier
module Junkyard
  # Object to represent each player.
  class Player
    def inspect
      [
        name,
        '(',
        "health: #{health}, ",
        " cards: [#{hand.map(&:name)}]",
        ')'
      ].join
    end
  end
end
