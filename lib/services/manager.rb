require 'singleton'
require_relative 'redis_service'

class Manager
  include Singleton

  def self.connect(url)
    instance.service = RedisService.for_url url
    instance 
  end

  attr_accessor :service

  def initialize
    @service = nil
  end

  def list_keys
    service.keys
  end
end
