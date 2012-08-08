class UsersController < ApplicationController
  # before_filter update_users_activities, :only => :index

  def index
  end
  
  def show
    if current_user
      @activities = current_user.activities
      @last_activity = runkeeper_user.past_activity(@activities.last.uri)
    else
      @activities = []
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
  
end
