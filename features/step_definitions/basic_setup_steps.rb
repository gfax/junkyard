Given /^a game of junkyard$/ do
  @game = Junkyard::Game::Default.new
end

Given /^there is a player named ([a-zA-Z_]+)$/ do |name|
  @game.players.add name: name
end

Then /^([a-zA-Z_+]+)'s health is (\d+)$/ do |name, health|
  expect(@game.players.find_by(name: name).health).to eq(health.to_i)
end

Then /^there are (\d+) cards in the deck$/ do |count|
  expect(@game.deck.count).to eq(count.to_i)
end
