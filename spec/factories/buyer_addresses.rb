FactoryBot.define do
  factory :buyer_address do
    token          {"tok_abcdefghijk00000000000000000"}
    post_code      {"111-1111"}
    city           {"市"}
    house_number   {"番地"}
    prefecture_id  {"22"}
    building_name  {"建物"}
    phone_number   {"09012341234"}
  end
end