require 'active_support'
require 'active_support/core_ext'

Given(/^a game of junkyard$/) do
  @game = Junkyard::Game::Default.new
end

Given(/^the game begins$/) do
  @game.start
end

Given(/^there is a player named ([a-zA-Z_]+)\s*(with a ([a-z_]+)(, and ([a-z_]+))?)?$/) do |name, card1_setup, card1, card2_setup, card2|
  player = @game.players.add name: name

  player.hand << @game.deck.pull(card1.to_sym) if card1_setup.present?
  player.hand << @game.deck.pull(card2.to_sym) if card2_setup.present?
end

When(/^([a-zA-Z_+]+) uses ([a-z_]+)\s*(against ([a-zA-Z_+]+))?$/) do |name, card, has_target, target|
  @player = @game.players.find_by(name: name)

  if has_target.present?
    @target = @game.players.find_by(name: target)
    expect(@target).to_not be(nil)
  end

  @game.move.play cards: card.to_sym, target: @target
end

When(/^([a-zA-Z_+]+) passes$/) do |name|
  @player = @game.players.find_by(name: name)
  expect(@game.move.player).to be(@player)

  @game.move.pass
end

Then(/^it is ([a-zA-Z_+]+)'s turn$/) do |name|
  @player = @game.players.find_by(name: name)
  expect(@game.turn.player).to be(@player)
end

Then(/^it is ([a-zA-Z_+]+)'s move$/) do |name|
  @player = @game.players.find_by(name: name)
  expect(@game.move.player).to be(@player)
end

Then(/^([a-zA-Z_+]+)'s health is (\d+)$/) do |name, health|
  @player = @game.players.find_by(name: name)
  expect(@player.health).to eq(health.to_i)
end

Then(/^(his|her) hand should have (\d+) cards$/) do |_pronoun, count|
  expect(@player.hand.count).to eq(count.to_i)
end

Then(/^there (are|is) (\d+) cards? in the deck$/) do |_, count|
  expect(@game.deck.count).to eq(count.to_i)
end

Then(/^there (are|is) (\d+) cards? in the discard$/) do |_, count|
  expect(@game.discard.count).to eq(count.to_i)
end

Then(/^([a-zA-Z_+]+)'s has a ([a-z_]+)$/) do |name, card|
  @player = @game.players.find_by(name: name)
  expect(@player.hand.has?(card)).to be(true)
end
