FactoryBot.define do
  factory :item do
    association :user
    name             {Faker::Commerce.product_name}
    explanation          {Faker::String.random}
    category_id          {Faker::Number.between(from:2,to:11)}
    state_id             {Faker::Number.between(from:2,to:7)}
    delivery_fee_id      {Faker::Number.between(from:2,to:3)}
    prefecture_id        {Faker::Number.between(from:2,to:48)}
    day_id               {Faker::Number.between(from:2,to:4)}
    price                {Faker::Number.between(from:300,to:9999999)}
    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/files/test.png'),filename: 'test.png')
    end
  end
end