require 'redis'

class RedisService

  def self.for_url(url)
    begin
      new init_redis_if_valid(url)
    rescue Redis::ProtocolError, ArgumentError
      raise RedisResourceError.new
    end
  end


  def initialize(redis_client)
    @redis_client = redis_client
  end

  private
  def self.init_redis_if_valid(url)
    redis_client = Redis.new url: url
    redis_client.ping
    redis_client
  end

end

class RedisResourceError < Exception ; end
