# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  twitter    :string(255)
#  uid        :string(255)
#  provider   :string(255)
#  runkeeper  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :provider, :runkeeper, :twitter, :uid
end
