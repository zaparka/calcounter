# == Schema Information
#
# Table name: foods
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)     not null
#  calories     :integer(4)      not null
#  portion_size :integer(4)      not null
#  unit         :string(255)     not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  category_id  :integer(4)
#

class Food < ActiveRecord::Base
  validates_uniqueness_of :name
  attr_accessible :calories, :portion_size, :unit, :name, :category_id
  belongs_to :category
end
