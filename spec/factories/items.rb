FactoryBot.define do
  factory :item do
    product            { Faker::Lorem.sentence }
    explanation        { Faker::Lorem.sentence }
    condition_id       { Faker::Number.between(from: 2, to: 7) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id    { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testimage.png'), filename: 'testimage.png')
    end
  end
end
