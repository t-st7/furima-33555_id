FactoryBot.define do
  factory :user_order do
    zip                    { '123-4567' }
    state_id               { 1 }
    city                   { '東京都' }
    address_line           { '目黒区３−３−３' }
    address_line_second    { 'フォンテーヌビル506号室' }
    phone_number           { '09012345678' }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
