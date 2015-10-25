Feature: Default Deck Counters

  Scenario: Block
    Given a game of junkyard
    And there is a player named Kevin with a gut_punch
    And there is a player named Jay with a block

    When the game begins
    And Kevin uses gut_punch against Jay
    And Jay uses block

    Then it is Jay's turn
    And Jay's health is 10
    And there are 2 cards in the discard

  Scenario: Mattress
    Given a game of junkyard
    And there is a player named Kevin with a uppercut
    And there is a player named Jay with a mattress

    When the game begins
    And Kevin uses uppercut against Jay
    And Jay uses mattress

    Then it is Jay's turn
    And Jay's health is 7
