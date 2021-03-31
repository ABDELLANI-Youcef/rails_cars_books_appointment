FactoryBot.define do
  factory :appointment do
    city { Faker::Lorem.character }
    date { Faker::Date.backward(days: 1) }
    car_id { car }
    user_id { user }
  end
end
