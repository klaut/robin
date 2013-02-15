 require_relative "../../lib/services/redis_service"

 describe RedisService do

   context "connecting to redis" do
     it 'returns redis service object if valid url' do
       RedisService.stub(:init_redis_if_valid) {stub}
       redis = RedisService.for_url "redis://127.0.0.1:6379/1" 
       redis.should be_instance_of RedisService
     end

     it 'raises exception if wrong protocol' do
       RedisService.stub(:init_redis_if_valid) { raise Redis::ProtocolError }
       expect do
         redis = RedisService.for_url "http://google.com"
       end.to raise_error(RedisService::ResourceError)
     end

     it 'raises exception if bad url' do
       RedisService.stub(:init_redis_if_valid) { raise ArgumentError }
       expect do
         redis = RedisService.for_url "bad"
       end.to raise_error(RedisService::ResourceError)
     end
   end

   context "interracting with redis" do
     subject {RedisService.for_url "test"}
     let(:redis) { stub(keys:["1:a", "2:b"], type:"list", ping:'pong')}
     before do
       Redis.stub(:new).and_return(redis)
     end 

     it "returns keys with types" do
       keys = subject.keys
       keys.should == [{name:'1:a', type:'list'}, {name:'2:b', type:'list'}]
     end
   end

 end
