# == Schema Information
#
# Table name: foods
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  calories     :integer(4)
#  portion_size :integer(4)
#  unit         :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Food < ActiveRecord::Base
  attr_accessible :calories, :portion_size, :unit, :name
end
