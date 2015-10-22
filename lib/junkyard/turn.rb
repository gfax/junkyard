module Junkyard
  class Turn
    attr_reader :player, :action, :parent

    def root?
      @parent.nil?
    end

    def root
      root? ? @parent.root : self
    end

    def game
      @parent ? root.game : @game
    end

    def initialize options
      @player = options[:player]
      @game   = options[:game]
      @parent = options[:parent]
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
      game.turns << Turn.new(parent: self, player: target)
    end

    def execute_action
      unless action.nil?
        case action[:type]
        when :attack
          action[:target].health -= action[:damage]
        end
      end

      parent.execute_action unless root?
    end

    def pass
      if root?
        game.next_turn game.players.after(player)
      else
        execute_action
      end
    end
  end
end
