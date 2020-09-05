Faker::Config.locale = :ja
FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname { Faker::Name.last_name }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birth_date { Faker::Date.birthday }
  end
end
