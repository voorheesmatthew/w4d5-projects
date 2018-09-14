FactoryBot.define do
  factory :user do
    username { Faker::BreakingBad.character }
    password { Faker::BreakingBad.episode }
  end
end
