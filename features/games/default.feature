Feature: Default Deck

  Scenario: Gut punch
    Given a game of junkyard
    And there is a player named Kevin with a gut_punch
    And there is a player named Jay

    When the game begins
    And Kevin uses gut_punch against Jay
    And Jay passes

    Then Jay's health is 8

  Scenario: Uppercut
    Given a game of junkyard
    And there is a player named Kevin with a uppercut
    And there is a player named Jay

    When the game begins
    And Kevin uses uppercut against Jay
    And Jay passes

    Then Jay's health is 5

  Scenario: Block
    Given a game of junkyard
    And there is a player named Kevin with a gut_punch
    And there is a player named Jay with a block

    When the game begins
    And Kevin uses gut_punch against Jay
    And Jay uses block

    Then it is Jay's turn
    And Jay's health is 10

  Scenario: Mattress
    Given a game of junkyard
    And there is a player named Kevin with a uppercut
    And there is a player named Jay with a mattress

    When the game begins
    And Kevin uses uppercut against Jay
    And Jay uses mattress

    Then it is Jay's turn
    And Jay's health is 7

  Scenario: Sub
    Given a game of junkyard
    And there is a player named Kevin with a uppercut
    And there is a player named Jay with a mattress, and sub

    When the game begins
    And Kevin uses uppercut against Jay
    And Jay uses mattress
    And Jay uses sub

    Then Jay's health is 9
