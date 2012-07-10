# == Schema Information
#
# Table name: activities
#
#  id         :integer(4)      not null, primary key
#  uri        :string(255)
#  calories   :integer(4)
#  type       :string(255)
#  start_time :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer(4)      not null
#

require 'spec_helper'

describe Activity do
  it "belongs to user" do
    user = User.create(:name => "John")
    activity = Activity.create(:user => user)
    activity.reload.user.should == user
  end
end
