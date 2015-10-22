Feature: Basic Setup

  Scenario: Two players
    Given a game of junkyard
    And there is a player named Kevin
    And there is a player named Jay

    When the game begins

    Then Kevin's health is 10
    And his hand should have 5 cards
    And Jay's health is 10
    And his hand should have 5 cards
    And there are 97 cards in the deck
