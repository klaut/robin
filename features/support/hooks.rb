Before do |scenario|
  #prepare redis
  @test_redis = Redis.connect url:REDIS_TEST_URL
  @test_redis.flushall
end

After do |scenario|
  @test_redis.flushall
  #@test_redis.client.disconnect
  @test_redis.quit
end
