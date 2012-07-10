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

require 'spec_helper'

describe Food do
  pending "add some examples to (or delete) #{__FILE__}"
end
