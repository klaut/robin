Feature: User can browse redis

  Scenario: list redis keys
    When I am connected to Redis
    And redis has data 
    Then I see all the keys and their types

  Scenario: empty redis
    When I am connected to Redis
    And redis is empty
    Then I don't see any keys

