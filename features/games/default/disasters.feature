Feature: Default Deck Disasters

  Scenario: Toolbox
    Given a game of junkyard
    And there is a player named Kevin with a toolbox, and gut_punch
    And there is a player named Jay

    When the game begins
    And Kevin uses toolbox
    And Kevin uses gut_punch against Jay
    And Jay passes

    Then it is Jay's turn
    Then Jay's health is 8
