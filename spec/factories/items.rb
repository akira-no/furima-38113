FactoryBot.define do
  factory :item do
    image              {Faker::Lorem.sentence}
    product            {Faker::Lorem.sentence(max_length: 40)}
    explanation        {Faker::Lorem.sentence(max_length: 1000)}
    condition_id       {Faker::Number.between(2, 7)}
    category_id        {Faker::Number.between(2, 11)}
    delivery_charge_id {Faker::Number.between(2, 3)}
    prefecture_id      {Faker::Number.between(2, 48)}
    delivery_day_id    {Faker::Number.between(2, 4)}
    price              {Faker::Number.between(300, 9999999)}
  end
end
