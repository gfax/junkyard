module Junkyard
  module Game
    class Base
      attr_accessor :players
      attr_accessor :deck

      def initialize
        @players = PlayerCollection.new
        @deck    = Deck.new

        @@cards.each do |card|
          card[:options][:count].times { deck << Card.new(card) }
        end
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
