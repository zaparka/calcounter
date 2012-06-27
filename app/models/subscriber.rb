class Subscriber < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s,]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  attr_accessible :email
end
