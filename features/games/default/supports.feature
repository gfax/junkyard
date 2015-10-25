Feature: Default Deck Supports

  Scenario: Sub
    Given a game of junkyard
    And there is a player named Kevin with a uppercut
    And there is a player named Jay with a mattress, and sub

    When the game begins
    And Kevin uses uppercut against Jay
    And Jay uses mattress
    And Jay uses sub

    Then Jay's health is 9

  Scenario: Soup
    Given a game of junkyard
    And there is a player named Kevin with a uppercut
    And there is a player named Jay with a soup

    When the game begins
    And Kevin uses uppercut against Jay
    And Jay passes
    And Jay uses soup

    Then Jay's health is 6
