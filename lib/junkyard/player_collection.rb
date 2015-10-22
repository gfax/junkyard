module Junkyard
  class PlayerCollection < Array
    def add options
      push Player.new options
    end

    def find_by attrs
      detect do |player|
        attrs.inject(true) { |pick, (k, v)| pick && player.send(k) == v }
      end
    end
  end
end
