Feature: Basic Setup

  Scenario: Two players
    Given a game of junkyard
    And there is a player named Kevin
    And there is a player named Jay

    Then Kevin's health is 10
    And Jay's health is 10
    And there are 107 cards in the deck
