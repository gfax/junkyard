require 'active_support'
require 'active_support/core_ext'

Given /^a game of junkyard$/ do
  @game = Junkyard::Game::Default.new
end

Given /^the game begins$/ do
  @game.start
end

Given /^there is a player named ([a-zA-Z_]+)\s*(with a ([a-z_]+))?$/ do |name, card_setup, card|

  player = @game.players.add name: name

  if card_setup.present?
    player.hand << @game.deck.pull(card.to_sym)
  end
end

When /^([a-zA-Z_+]+) uses ([a-z_]+)\s+(against ([a-zA-Z_+]+))$/ do |name, card, has_target, target|
  @player = @game.players.find_by(name: name)
  expect(@game.turn.player).to be(@player)

  if has_target.present?
    @target = @game.players.find_by(name: target)
    expect(@target).to_not be(nil)
  end

  @game.turn.play cards: card.to_sym, target: @target
end

When(/^([a-zA-Z_+]+) passes$/) do |name|
  @player = @game.players.find_by(name: name)
  expect(@game.turn.player).to be(@player)

  @game.turn.pass
end

Then /^([a-zA-Z_+]+)'s health is (\d+)$/ do |name, health|
  @player = @game.players.find_by(name: name)
  expect(@player.health).to eq(health.to_i)
end

Then /^(his|her) hand should have (\d+) cards$/  do |pronoun, count|
  expect(@player.hand.count).to eq(count.to_i)
end

Then /^there are (\d+) cards in the deck$/ do |count|
  expect(@game.deck.count).to eq(count.to_i)
end
