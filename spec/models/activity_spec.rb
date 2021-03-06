# == Schema Information
#
# Table name: activities
#
#  id             :integer(4)      not null, primary key
#  uri            :string(255)
#  calories       :integer(4)
#  activity_type  :string(255)
#  start_time     :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  user_id        :integer(4)      not null
#  total_distance :float
#

require 'spec_helper'

describe Activity do
  it "belongs to user" do
    user = User.create(:name => "John")
    activity = Activity.create(:user => user)
    activity.reload.user.should == user
  end
  
  describe "update_from_stream!" do
    it "update current actity with data from stream" do
      stream = {"total_calories" => 345}
      activity = Activity.new()
      activity.should_receive(:save)

      act = activity.update_from_stream!(stream)
      act.calories.should == 345
    end
  end
end
