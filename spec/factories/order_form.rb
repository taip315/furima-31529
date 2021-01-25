FactoryBot.define do
  factory :order_form do
    
    postal_number                 {"123-1234"}
    prefecture_id                 {Faker::Number.between(from:2,to:48)}
    municipality                  {Gimei.address.city.kanji}
    address                       {"中央1-1-1"}
    building                      {"山田ビル201"}
    phone_number                  {Faker::Number.leading_zero_number(digits: 10)}
    token                         {Faker::Alphanumeric.alphanumeric(number:30)}
    
  end
end