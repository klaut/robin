 require_relative "../../lib/services/redis_service"

 describe RedisService do

   context "connecting to redis" do
     it 'returns redis service object if valid url' do
       RedisService.stub(:init_redis_if_valid) {stub}
       redis = RedisService.for_url "good" 
       redis.should be_instance_of RedisService
     end

     it 'raises exception if wrong protocol' do
       RedisService.stub(:init_redis_if_valid) { raise Redis::ProtocolError }
       expect do
         redis = RedisService.for_url "wrong"
       end.to raise_error(RedisResourceError)
     end

     it 'raises exception is bad url' do
       RedisService.stub(:init_redis_if_valid) { raise ArgumentError }
       expect do
         redis = RedisService.for_url "bad"
       end.to raise_error(RedisResourceError)
     end
   end

 end
