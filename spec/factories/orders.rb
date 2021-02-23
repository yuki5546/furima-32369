FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code     { "#{rand(100..999)}-#{rand(1_000..9_999)}" }
    prefecture      { rand(2..48) }
    city            { Faker::Lorem.word }
    address         { Faker::Lorem.sentence }
    building        { Faker::Lorem.word }
    phone_number    { "0#{rand(0..9)}0#{rand(0_000_000..99_999_999)}" }
  end
end
