Feature: Default Deck

  Scenario: Gut punch
    Given a game of junkyard
    And there is a player named Kevin with a gut_punch
    And there is a player named Jay

    When the game begins
    And Kevin uses gut_punch against Jay
    And Jay passes

    Then Jay's health is 8
