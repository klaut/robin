require_relative "../../lib/services/redis_service"

When /^I insert a valid Redis url$/ do
  @redis = RedisService.for_url(REDIS_TEST_URL)
end

Then /^I should be connected to Redis$/ do 
  @redis.should be_kind_of RedisService
end
