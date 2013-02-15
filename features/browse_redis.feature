Feature: User can browse redis

  Scenario: list redis keys
    When I am connected to Redis
    Then I see all the keys and their types

  Scenario: there is a bug in listing keys with cucumber.
