FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "ames#{n}" }
    name Faker::RickAndMorty.character
    url "http://example.com"
    avatar_url Faker::Avatar.image
    provider "github"
  end
end
