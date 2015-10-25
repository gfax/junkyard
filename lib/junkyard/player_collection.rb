module Junkyard
  class PlayerCollection < Array
    def add options
      player = Player.new options
      push player
      player
    end

    def find_by attrs
      detect do |player|
        attrs.inject(true) { |pick, (k, v)| pick && player.send(k) == v }
      end
    end

    def after player
      index = find_index(player) + 1
      index > count - 1 ? first : at(index)
    end

    def random options = {}
      select { |player| player != options[:except] }.sample
    end
  end
end
