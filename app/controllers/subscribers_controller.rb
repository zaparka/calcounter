class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      flash[:notice] = "Thank you for your subscription."
    else
      flash[:error] = "Given email is invalid"
    end

    redirect_to root_url
  end
end
