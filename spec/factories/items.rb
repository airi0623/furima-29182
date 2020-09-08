FactoryBot.define do
  factory :item do
    item_name {Takarabako.open}
    detail {Faker::Base.regexify("[aあ]{1,50}")}
    #{Faker::Books::Lovecraft.sentences}
    association :user
    category_id {Faker::Number.between(from: 2, to: 10)}
    status_id {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id {Faker::Number.between(from: 2, to: 7)}
    shipping_region_id {Faker::Number.between(from: 1, to: 47)}
    date_shipment_id {Faker::Number.between(from: 2, to: 3)}
    price {Faker::Number.within(range: 300..9999999)}
    image {Faker::Lorem.sentence}
  end
end
