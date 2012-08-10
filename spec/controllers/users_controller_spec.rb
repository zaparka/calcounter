require 'spec_helper'

describe UsersController do
  describe "GET show" do
    it "load users activities and latest activity" do
      activity = mock("activity", :calories => 222, :uri => "uri")
      runkeeper = mock("runkeeper")
      runkeeper.should_not_receive(:past_activity)
      controller.stub(:runkeeper_user).and_return runkeeper

      user = mock("user", :activities => [activity])
      controller.stub(:current_user).and_return user
    
      get :show, :id => 3
      assigns(:activities).should == [activity]
      assigns(:last_activity).should == activity
    end

    it "load latest activity from runkeeper" do
      activity = mock("activity", :calories => nil, :uri => "correct uri")
      user = mock("user", :activities => [activity])
      runkeeper = mock("runkeeper")
      runkeeper.should_receive(:past_activity).with("correct uri").and_return "last activity"
      
      controller.stub(:runkeeper_user).and_return runkeeper
      controller.stub(:current_user).and_return user

      get :show, :id => 3
      assigns(:last_activity).should == "last activity"
    end
    
  end
end
