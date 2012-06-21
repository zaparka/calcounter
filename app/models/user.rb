class User < ActiveRecord::Base
  attr_accessible :name, :provider, :runkeeper, :twitter, :uid
end
