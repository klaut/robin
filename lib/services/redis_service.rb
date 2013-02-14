require 'redis'

class RedisService

  def self.for_url(url)
    begin
      redis_client = Redis.new url: url
      new redis_client
    rescue Redis::TimeoutError, Redis::ProtocolError, ArgumentError
      raise RedisResourceError.new
    end
  end

  def initialize(redis_client)
    @redis_client = redis_client
  end
end

class RedisResourceError < Exception ; end
