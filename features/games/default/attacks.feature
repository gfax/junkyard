Feature: Default Deck Attacks

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

  Scenario: Kickball
    Given a game of junkyard
    And there is a player named Kevin with a kickball
    And there is a player named Jay

    When the game begins
    And Kevin uses kickball against Jay
    And Jay passes

    Then Jay's health is 6

  Scenario: Neck Punch
    Given a game of junkyard
    And there is a player named Kevin with a neck_punch
    And there is a player named Jay

    When the game begins
    And Kevin uses neck_punch against Jay
    And Jay passes

    Then Jay's health is 7

  Scenario: Grease Bucket
    Given a game of junkyard
    And there is a player named Kevin with a grease_bucket
    And there is a player named Jay

    When the game begins
    And Kevin uses grease_bucket against Jay
    And Jay passes

    Then it is Kevin's turn
    And Jay's health is 8
    And there is 1 card in the discard

  Scenario: Acid Coffee
    Given a game of junkyard
    And there is a player named Kevin with a acid_coffee
    And there is a player named Jay

    When the game begins
    And Kevin uses acid_coffee against Jay
    And Jay passes

    Then it is Kevin's turn
    And Jay's health is 7
    And there is 1 card in the discard

  Scenario: Siphon
    Given a game of junkyard
    And there is a player named Kevin with a gut_punch
    And there is a player named Jay with a siphon

    When the game begins
    And Kevin uses gut_punch against Jay
    And Jay passes
    And Jay uses siphon against Kevin
    And Kevin passes

    Then it is Kevin's turn
    And Kevin's health is 9
    And Jay's health is 9
    And there are 2 cards in the discard
