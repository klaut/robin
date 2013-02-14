 require_relative "../../lib/services/redis_service"

 describe RedisService do

   context "connecting to redis" do
     it 'returns redis service object if valid url' do
       Redis.should_receive(:new).with(anything).and_return(stub)
       redis = RedisService.for_url "good" 
       redis.should be_instance_of RedisService
     end

     it 'raises exception if wrong protocol' do
       Redis.should_receive(:new).with(anything).and_raise(Redis::ProtocolError.new "message") 
       url = "wrong"
       expect do
         redis = RedisService.for_url url
       end.to raise_error(RedisResourceError)
     end

     it 'raises exception is bad url' do
       Redis.should_receive(:new).with(anything).and_raise(ArgumentError.new "message")
       expect do
         redis = RedisService.for_url "bad"
       end.to raise_error(RedisResourceError)
     end
   end

 end
