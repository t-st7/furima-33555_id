FactoryBot.define do
  factory :item do
    product             { 'kumo' }
    description         { '雲です。' }
    category_id         { '2' }
    delivery_charge_id  { '2' }
    state_id            { '2' }
    condition_id        { '2' }
    day_to_ship_id      { '2' }
    price               { '22222' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
