require_relative '../../lib/services/manager'

def prepare_redis(values)
  @test_redis.set(values[:key], values[:value])
end

When /^I am connected to Redis$/ do
   @redis_manager = Manager.connect(REDIS_TEST_URL)
end

# bug - why this passes?
Then /^I see all the keys and their types$/ do
  prepare_redis({key:'1:a', value:'test'})
  @redis_manager.list_keys.should == [{name:'1:a', type:'string'}]
end
