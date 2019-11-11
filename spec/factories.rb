FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
    losses {0}
    wins {0}
  end

  factory :game do
    name { "game name" }
    association :user
  end

  factory :piece do
    location_x {2}
    location_y {3}
    association :game
  end
end