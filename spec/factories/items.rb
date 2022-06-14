FactoryBot.define do
  factory :item do
    product            {Faker::Lorem.sentence}
    explanation        {Faker::Lorem.sentence}
    condition_id       {Faker::Number.between(2, 7)}
    category_id        {Faker::Number.between(2, 11)}
    delivery_charge_id {Faker::Number.between(2, 3)}
    prefecture_id      {Faker::Number.between(2, 48)}
    delivery_day_id    {Faker::Number.between(2, 4)}
    price              {Faker::Number.between(300, 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testimage.png'), filename: 'testimage.png')
    end
  end
end
