require 'spec_helper'

describe User do
  describe "load_latest_data" do
    it "set distance_units if is not set" do
      user = User.new
      runkeeper = mock("runkeeper", :settings => {"distance_units" => "km"}, :fitness_activities => {"items" => []})
      user.should_receive(:update_attribute).with(:distance_unit, "km")
      user.load_latest_data(runkeeper)
    end

    it "should not set distance_units if they are not blank" do
      user = User.new(:distance_unit => "km")
      runkeeper = mock("runkeeper", :fitness_activities => {"items" => []})
      user.should_not_receive(:update_attribute).with(:distance_unit, "km")
      user.load_latest_data(runkeeper)
    end

    it "should create new activity from runkeeper stream" do
      user = User.new(:distance_unit => "km")
      activity_item = {"uri" => "uri of activity", "type" => "running",
                       "start_time" => "2012-08-08 13:34:33", "total_distance" => "2222"}
      runkeeper = mock("runkeeper", :fitness_activities => {"items" => [activity_item]})
      Activity.should_receive(:create).with(:user => user,
                                            :uri => "uri of activity",
                                            :activity_type => "running",
                                            :start_time => 1344432873,
                                            :total_distance => "2222")

      user.load_latest_data(runkeeper)
    end
  end
end
