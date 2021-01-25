FactoryBot.define do
  factory :user_order do
    zip                    {'123-4567'}
    state_id               {'1'}
    city                   {'東京都'}
    address_line           {'目黒区３−３−３'}
    address_line_second    {'フォンテーヌビル506号室'}
    phone_number           {'09012345678'}
    user_id                {'1'}
    item_id                {'1'}
    order_id               {'1'}
    price                  {'3000'}
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end