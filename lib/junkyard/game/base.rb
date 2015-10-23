module Junkyard
  module Game
    class Base
      attr_reader :players
      attr_reader :deck
      attr_reader :turns

      def turn
        turns.last
      end

      def move
        turn.move
      end

      def initialize
        @players = PlayerCollection.new
        @deck    = Deck.new
        @turns   = []

        @@cards.each do |card|
          card[:options][:count].times { deck << Card.new(card) }
        end
      end

      def start
        deck.shuffle!
        players.each { |player| deal player }
        next_turn players.first
      end

      def deal player
        (5 - player.hand.count).times { player.hand << deck.pop }
      end

      def next_turn player
        @turns << Turn.new(self, player)
      end

      class << self
        @@cards = []

        def card name, options = { count: 1 }, &block
          @@cards << { name: name, options: options, block: block }
        end
      end
    end
  end
end
