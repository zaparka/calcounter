# == Schema Information
#
# Table name: users
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  twitter       :string(255)
#  uid           :string(255)
#  provider      :string(255)
#  runkeeper     :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  distance_unit :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :provider, :runkeeper, :twitter, :uid, :distance_unit

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

  def load_latest_data(runkeeper_user)
    unit = runkeeper_user.settings["distance_units"] if self.distance_unit.blank?
    self.update_attribute(:distance_unit, unit)

    activities = runkeeper_user.fitness_activities["items"]
    activities.each do |activity|
      Activity.create(:user => self,
                      :uri => activity["uri"],
                      :activity_type => activity["type"],
                      :start_time => activity["start_time"].to_time.to_i,
                      :total_distance => activity["total_distance"])
    end
  end
  
end
