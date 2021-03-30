FactoryBot.define do
  factory :car do
    mark { Faker::Lorem.word }
    model { Faker::Lorem.word }
    year { 2021 }
    price { 100 }
  end
end