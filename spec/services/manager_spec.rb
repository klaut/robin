require_relative '../../lib/services/manager'

describe Manager do

  let(:manager) {  Manager.connect("redis://127.0.0.1/1") }
  before do
    RedisService.stub(:for_url){ stub }
  end

  context "#connect" do
    it "connects to a redis service" do
      manager.should_not be_nil
    end

    it "should be a single instance" do
      manager2 = Manager.connect('redis://127.0.0.1/2')
      manager.should == manager2
    end
  end

end
