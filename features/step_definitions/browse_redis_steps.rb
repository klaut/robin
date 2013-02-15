require_relative '../../lib/services/manager'

When /^I am connected to Redis$/ do
   @redis_manager = Manager.connect("redis://127.0.0.1/1")
end

# bug - why this passes?
Then /^I see all the keys and their types$/ do
  keys = @redis_manager.list_keys
  keys == []
end
