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

require 'spec_helper'

describe Food do
  pending "add some examples to (or delete) #{__FILE__}"
end
