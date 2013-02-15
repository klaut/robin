require_relative '../../lib/services/manager'

def prepare_redis(values)
  @test_redis.set(values[:key], values[:value])
end

def empty_redis
  @test_redis.flushall
end

When /^I am connected to Redis$/ do
   @redis_manager = Manager.connect(REDIS_TEST_URL)
end

When /^redis has data$/ do
  prepare_redis({key:'1:a', value:'test'})
end

Then /^I see all the keys and their types$/ do
  @redis_manager.list_keys.should == [{name:'1:a', type:'string'}]
end

When /^redis is empty$/ do
  empty_redis
end

Then /^I don't see any keys$/ do
  @redis_manager.list_keys.should == []
end
