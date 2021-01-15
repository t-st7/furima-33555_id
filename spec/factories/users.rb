FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000aaa' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太朗' }
    kana_last_name        { 'アア' }
    kana_first_name       { 'アア' }
    birthday              { '1930-01-01' }
  end
end
