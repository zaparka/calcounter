# require("runkeeper")

class UsersController < ApplicationController
  def index
    @activities = []
    if current_user
      user = Runkeeper.new(session[:user_token])
      @activities = user.fitness_activities["items"]
      update_users_activities if @activities.present?
      @last_activity = user.past_activity(@activities.first["uri"])
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end
  
  private
  def update_users_activities
    @activities.each do |activity|
      Activity.create(:user => current_user,
                      :uri => activity["uri"],
                      :type => activity["type"],
                      :start_time => activity["start_time"])
      
    end
  end
end
