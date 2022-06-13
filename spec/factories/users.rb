FactoryBot.define do

  factory :user do

    # transient do
    #   person {Gimei.name}
    # end

    nickname              {"a"}
    email                 {"aa@aaa"}
    password              {"aaaaaa"}
    password_confirmation {"aaaaaa"}
    last_name             {"山田"}
    first_name            {"山田"}
    name_sei              {"ヤマ"}
    name_mei              {"ヤマ"}
    birth_date            {"1955-09-22"}
  end
end
