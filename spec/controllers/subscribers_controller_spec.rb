require 'spec_helper'

describe SubscribersController do
  describe "POST create" do
    before(:each) do
      @subscriber = mock("subscriber")
    end

    it "create subscriber from params" do
      Subscriber.should_receive(:new).with({"new" => "params"}).and_return @subscriber
      @subscriber.should_receive(:save).and_return false
      post :create, :subscriber => {"new" => "params"}
      
      response.should redirect_to root_url
    end

    it "create subscriber from params" do
      Subscriber.should_receive(:new).with({"new" => "params"}).and_return @subscriber
      @subscriber.should_receive(:save).and_return false
      post :create, :subscriber => {"new" => "params"}
      
      response.should redirect_to root_url
      flash[:error].should == "Given email is invalid"
    end
  end
end
