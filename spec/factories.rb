FactoryGirl.define do
  factory :folio do 
    title   "Favorites"
    user
  end
  
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

end