require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    before(:each) do
      stub_request(:get, "http://api.runkeeper.com/user").to_return(:status => 200, :body => "", :headers => {})
      controller.stub(:env).and_return({"omniauth.auth" => {"credentials" => mock("credentials", :token => "asda")}})
    end

    it "save user's id to session based on omniauth" do
      user = mock("user", :id => 3, :load_latest_data => true)
      User.stub(:find).with(3).and_return user
      User.should_receive(:from_omniauth).and_return user

      post :create, :provider => "runkeeper"
      session[:user_id].should == 3
    end

    it "load latest date and redirect to user's profile" do
      user = mock("user", :id => 3)
      User.stub(:from_omniauth).and_return user
      controller.stub(:runkeeper_user).and_return "runkeeper_user"
      user.should_receive(:load_latest_data).with("runkeeper_user")

      post :create, :provider => "runkeeper"
      response.should redirect_to(user_url(user))
    end
  end
end
