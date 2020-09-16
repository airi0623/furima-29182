FactoryBot.define do
  factory :order_address do
    postal_code { "565-9987" }
    prefecture_id { Faker::Number.between(from:2, to:7)}
    city { Gimei.address.kanji }
    number { Gimei.town.kanji }
    building { "青山1-1" }
    phone { "08000000000" }
    token { Faker::Alphanumeric.alphanumeric(number: 10)}
  end
end
