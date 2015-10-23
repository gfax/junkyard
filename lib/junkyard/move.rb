module Junkyard
  class Move
    attr_reader :player, :parent, :action

    def initialize parent, player
      @parent = parent
      @player = player
    end

    def root?
      @parent.is_a? Turn
    end

    def root
      root? ? self : @parent.root
    end

    def turn
      root.parent
    end

    def game
      turn.game
    end

    def play options
      cards = options[:cards]
      cards = [cards] if cards.class == Symbol

      if player.hand.has? cards
        card = cards.shift
        card = player.hand.pull card

        target = options[:target]

        instance_exec target, &card.block
      else
        throw Junkyard::Exception.new
      end
    end

    def attack target, options
      @action = { type: :attack, damage: options[:damage], target: target }
      next_move target
    end

    def defend amount
      @action = { type: :block, amount: amount }
      execute_action self
    end

    def heal amount
      @action = { type: :heal, amount: amount }
      execute_action self
    end


    def execute_action prev
      unless action.nil?
        case action[:type]
        when :attack
          damage = action[:damage]
          if prev.action
            if prev.action[:type] == :block
              if prev.action[:amount] > -1
                damage -= prev.action[:amount]
              else
                damage = 0
              end
            end
          end

          action[:target].health -= damage
        when :heal
          player.health = [10, player.health + action[:amount]].min
        end
      end

      if root?
        game.next_turn game.players.after(player)
      else
        parent.execute_action self
      end
    end

    def pass
      execute_action self
    end

    private

    def next_move player
      turn.moves << Move.new(self, player)
    end

  end
end
