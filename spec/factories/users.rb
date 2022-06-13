FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    name_sei              { person.last.katakana }
    name_mei              { person.first.katakana }
    birth_date            { Faker::Date.backward }
  end
end
