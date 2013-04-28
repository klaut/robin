require 'spec_helper'
require_relative "../../lib/services/redis_service"

require 'json'

describe RedisService do
  before do 
    @test_redis = Redis.connect url:REDIS_TEST_URL
    @test_redis.flushall
  end

  after do 
    @test_redis.flushall
    @test_redis.quit
  end

  context "interracting with redis" do
    subject {RedisService.for_url REDIS_TEST_URL }

    it "returns keys with types" do
      @test_redis.pipelined do
        @test_redis.set '2:b', 'test'
        @test_redis.lpush '1:a', 'test'
        @test_redis.lpush '1:a', 'another'
      end
      keys = subject.keys
      keys.should == [{name:'2:b', type:'string'},{name:'1:a', type:'list'}]
    end
  end
end
