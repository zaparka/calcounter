FactoryGirl.define do
  factory :user do
    name "Petr"
    provider "runkeeper"
  end

  factory :activity do
    user FactoryGirl.create(:user)
    start_time Time.now
  end
end