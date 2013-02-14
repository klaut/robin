Feature: Users can connect to Redis

  Scenario: User can connect to local Redis
    When I insert Redis url for localhost
    Then I should be connected to Redis on localhost
