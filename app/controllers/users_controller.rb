# require("runkeeper")

class UsersController < ApplicationController
  def index
    @activities = []
    if current_user
      user = Runkeeper.new(session[:user_token])
      @activities = user.fitness_activities["items"]
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
    current_user
    @activities.each do |activity|
      # Activity.create(:)
    end
  end
end
