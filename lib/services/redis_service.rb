require 'redis'

class RedisService

  class ResourceError < Exception ; end

  def self.for_url(url)
    begin
      new init_redis_if_valid(url)
    rescue Redis::ProtocolError, ArgumentError
      raise ResourceError.new
    end
  end

  def initialize(redis_client)
    @client = redis_client
  end
  
  def keys
    @client.keys.map do |key|
      {name: key, type: @client.type(key)}
    end
  end

  private
  def self.init_redis_if_valid(url)
    redis_client = Redis.new url: url
    redis_client.ping
    redis_client
  end

end

