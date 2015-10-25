Feature: Default Deck Unstoppables

  Scenario: A Gun
    Given a game of junkyard
    And there is a player named Kevin with a a_gun
    And there is a player named Jay

    When the game begins
    And Kevin uses a_gun against Jay

    Then it is Jay's turn
    And Jay's health is 8

  Scenario: Tire Iron
    Given a game of junkyard
    And there is a player named Kevin with a tire_iron
    And there is a player named Jay

    When the game begins
    And Kevin uses tire_iron against Jay

    Then it is Jay's turn
    And Jay's health is 7

  Scenario: Cheap Shot
    Given a game of junkyard
    And there is a player named Kevin with a cheap_shot
    And there is a player named Jay

    When the game begins
    And Kevin uses cheap_shot against Jay

    Then it is Jay's turn
    And Jay's health is 9
