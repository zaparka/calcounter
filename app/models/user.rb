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

  has_many :activities

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.twitter = auth["info"]["nickname"]
    end
  end
  
end
