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

class Activity < ActiveRecord::Base
  attr_accessible :calories, :start_time, :type, :uri, :user_id, :user

  validates_presence_of :user_id
  validates_uniqueness_of :start_time, :scope => :user_id

  belongs_to :user
end