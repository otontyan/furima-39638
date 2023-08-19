FactoryBot.define do
  factory :user do
    nick_name             { 'test' }
    email                 { Faker::Internet.email }
    password              { '000000aa' }
    password_confirmation { password }
    family_name_kanji     { '苗字' }
    personal_name_kanji   { '名前' }
    family_name_kana      { 'ミョウジ' }
    personal_name_kana    { 'ナマエ' }
    birthdate             { '1930-01-01' }
  end
end
