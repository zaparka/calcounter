class Subscriber < ActiveRecord::Base
  validates_uniqueness_of :email
  attr_accessible :email
end
