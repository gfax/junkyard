module Junkyard
  class Deck < Array
    def pull card
      find { |c| c.is_a?(card) }
    end
  end
end
