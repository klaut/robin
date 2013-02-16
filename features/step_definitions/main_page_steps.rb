require_relative "../../lib/services/manager"

When /^I insert a valid Redis url$/ do
  @redis_manager = Manager.connect(REDIS_TEST_URL)
end

Then /^I should be connected to Redis$/ do 
  @redis_manager.service.should be_kind_of RedisService
end

When /^I insert a bad url "(.*?)" I see an error message$/ do |url|
  expect {
    @redis_manager = Manager.connect url
  }.to raise_error(RedisService::ResourceError)
end

