module Junkyard
  module Game
    class Default < Base
      card :gut_punch, count: 10 do |target|
        attack target, damage: 2
      end

      card :neck_punch, count: 10

      card :grab, count: 8

      card :kickball, count: 7
      card :sub, count: 7

      card :dodge, count: 6

      card :block, count: 5
      card :uppercut, count: 5

      card :mattress, count: 3
      card :grease_bucket, count: 3
      card :soup, count: 3

      card :acid_coffee, count: 2
      card :cheap_shot, count: 2
      card :insurance, count: 2
      card :meal_steal, count: 2
      card :mirror, count: 2
      card :siphon, count: 2
      card :slot_machine, count: 2
      card :surgery, count: 2
      card :tire, count: 2
      card :wrench, count: 2

      card :a_gun, count: 1
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
      card :shifty_business, count: 1
      card :the_bees, count: 1
      card :tire_iron, count: 1
      card :toolbox, count: 1
      card :whirlwind, count: 1
      card :windy, count: 1
    end
  end
end
