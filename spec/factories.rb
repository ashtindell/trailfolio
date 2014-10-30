FactoryGirl.define do
  sequence :name do |n|
    "Name-#{n}"
  end

  sequence :email do |n|
    "email-#{n}@gmail.com"
  end

  factory :user do
    name
    email
    password                "foobar"
    password_confirmation   "foobar"
  end

  factory :folio do 
    title   "Favorites"
    user
  end

  factory :trail do
    name "Sweetwater Creek"
    activity_type_name "hiking"
    city "Atlanta"
    state "Georgia"
    directions "leave Atlanta on I-20 heading west"
    folio
  end
end