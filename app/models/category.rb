class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  attr_accessible :name

  has_many :foods
end
