FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"1234ab"}
    password_confirmation {"1234ab"}
    first_name {"山田"}
    family_name {"花子"}
    first_name_kana {"ヤマダ"}
    family_name_kana {"ハナコ"}
    birth_year_id {2}
    birth_month_id {2}
    birth_day_id {2}

  end
end