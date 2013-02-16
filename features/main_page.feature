Feature: Users can connect to Redis

  Scenario: User can connect to Redis
    When I insert a valid Redis url
    Then I should be connected to Redis

  Scenario: Bad redis connection
    When I insert a bad url "bad" I see an error message
