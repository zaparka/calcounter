class ActivitiesController < ApplicationController
  before_filter :authenticate
  respond_to :json

  def show
    @activity = Activity.find(params[:id])
    if @activity.calories.blank?
      stream = runkeeper_user.past_activity(@activity.uri)
      @activity = @activity.update_from_stream!(stream)
    end
    render :json => @activity
  end
end