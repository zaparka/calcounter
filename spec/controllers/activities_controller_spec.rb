require 'spec_helper'

describe ActivitiesController do
  describe "GET show" do
    before(:each) do
      session[:user_id] = FactoryGirl.create(:user)
    end

    it "return activity details" do
      activity = FactoryGirl.create(:activity, :calories => 222)
      Activity.stub(:find).with("83").and_return activity

      get :show, :id => "83", :format => :json
      assigns(:activity).should == activity
      response.body.should == activity.to_json
    end

    it "return activity details with calouries" do
      activity = FactoryGirl.create(:activity, :calories => nil, :uri => "uri link")
      activity2 = FactoryGirl.create(:activity)
      runkeeper = mock("runkeeper")
      stream = mock("stream")
      
      Activity.stub(:find).with("83").and_return activity
      controller.should_receive(:runkeeper_user).and_return runkeeper
      runkeeper.should_receive(:past_activity).with('uri link').and_return stream
      activity.should_receive(:update_from_stream!).with(stream).and_return activity2

      get :show, :id => "83", :format => :json
      assigns(:activity).should == activity2
      response.body.should == activity2.to_json
    end
  end
end
