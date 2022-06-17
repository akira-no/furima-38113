FactoryBot.define do
  factory :buyer_address do
    post_code      {"111-1111"}
    city           {"市"}
    house_number   {"番地"}
    prefecture_id  {"22"}
    building_name  {"建物"}
    phone_number   {"090-1234-1234"}
  end
end
