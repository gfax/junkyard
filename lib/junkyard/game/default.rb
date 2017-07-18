module Junkyard
  module Game
    # TODO
    class Default < Base
      card :gut_punch, count: 10 do |target|
        attack target, damage: 2
      end

      card :neck_punch, count: 10 do |target|
        attack target, damage: 3
      end

      card :grab, count: 8

      card :kickball, count: 7 do |target|
        attack target, damage: 4
      end

      card :sub, count: 7 do
        heal 2
      end

      card :dodge, count: 6

      card :block, count: 5 do
        defend(-1)
      end

      card :uppercut, count: 5 do |target|
        attack target, damage: 5
      end

      card :mattress, count: 3 do
        defend 2
      end

      card :grease_bucket, count: 3 do |target, card|
        attack target, damage: 2

        card.attach_to target do
          before :turn do
            card.detach_from target
            move.skip
          end
        end
      end

      card :soup, count: 3 do
        heal 1
      end

      card :acid_coffee, count: 2 do |target, card|
        attack target, damage: 3

        card.attach_to target do
          before :turn do
            card.detach_from target
            move.skip
          end
        end
      end
      card :cheap_shot, count: 2 do |target|
        attack target, damage: 1, unstoppable: true
      end
      card :insurance, count: 2
      card :meal_steal, count: 2
      card :mirror, count: 2
      card :siphon, count: 2 do |target|
        attack target, damage: 1 do
          after { player.health += 1 }
        end
      end
      card :slot_machine, count: 2
      card :surgery, count: 2
      card :tire, count: 2
      card :wrench, count: 2

      card :a_gun, count: 1 do |target|
        attack target, damage: 2, unstoppable: true
      end
      card :armor, count: 1
      card :avalanche, count: 1
      card :bulldozer, count: 1
      card :crane, count: 1
      card :deflector, count: 1
      card :diesel_spill, count: 1
      card :earthquake, count: 1
      card :energy_drink, count: 1
      card :magnet, count: 1
      card :propeller, count: 1
      card :sleep, count: 1
      card :spare_bolts, count: 1
      card :reverse, count: 1

      card :shifty_business, count: 1 do
        other = game.players.random except: player

        player_hand = player.hand
        player.hand = other.hand
        other.hand = player_hand
      end

      card :the_bees, count: 1

      card :tire_iron, count: 1 do |target|
        attack target, damage: 3, unstoppable: true
      end

      card :toolbox, count: 1 do
        game.deal player, 8
      end

      card :whirlwind, count: 1
      card :windy, count: 1
    end
  end
end
