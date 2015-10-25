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

        game.discard << card

        target = options[:target]

        instance_exec target, card, &card.block
      else
        throw Junkyard::Exception.new
      end
    end

    def attack target, options, &block
      @action = { type: :attack, damage: options[:damage], target: target }
      @action[:observer] = Observer.new(&block) unless block.nil?

      if options[:unstoppable]
        execute_action self
      else
        next_move target
      end
    end

    def defend amount
      @action = { type: :block, amount: amount }
      execute_action self
    end

    def heal amount
      @action = { type: :heal, amount: amount }
      execute_action self
    end

    def pass
      execute_action self
    end

    def skip
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

          action[:observer].execute :after, self unless action[:observer].nil?
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

    def begin

    end

    private

    def next_move player
      turn.moves << Move.new(self, player)
      turn.moves.last.begin
    end

  end
end
