Feature: Users can connect to Redis

  Scenario: User can connect to Redis
    When I insert a valid Redis url
    Then I should be connected to Redis
