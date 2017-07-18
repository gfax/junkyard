module Junkyard
  # Player's hand of cards
  class Hand < Array
    def has?(cards)
      cards = cards.to_sym if cards.class == String
      cards = [cards] if cards.class == Symbol
      cards.map { |card| !find { |c| c.name == Card.extract_name(card) }.nil? }.all?
    end

    def pull(card)
      delete_at(index { |c| c.name == Card.extract_name(card) })
    end
  end
end
