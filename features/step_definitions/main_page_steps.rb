require_relative "../../lib/services/redis_service"

When /^I insert a valid Redis url$/ do
  @redis = RedisService.for_url("redis://127.0.0.1")
end

Then /^I should be connected to Redis$/ do 
  @redis.is_a? RedisService
end
