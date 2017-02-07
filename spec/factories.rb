FactoryGirl.define do

  sequence(:username) {|n| "Example user #{n}"}
  sequence(:title) {|n| "Example title #{n}"}

  factory :user do
    username
    password "goodpassword"
    password_confirmation "goodpassword"
  end

  factory :post do
    title
    content "Really long example content stuff"
    user
  end

  factory :rating do
    score 5
    post
  end

  trait :with_ratings do
    after :create do |post|
      FactoryGirl.create_list :rating, 3, post: post
    end
  end


end
