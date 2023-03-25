FactoryBot.define do
  factory :item do
    name                 {Faker::Name.initials(number: 2) }
    content              {Faker::Lorem.sentence }
    category_id          {2}
    condition_id         {Faker::Number.between(from: 2, to: 3) }
    charge_id            {Faker::Number.between(from: 2, to: 3) }
    prefecture_id        {Faker::Number.between(from: 2, to: 3) }
    term_id              {Faker::Number.between(from: 2, to: 3) }
    price                { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/omu.png'), filename: 'omu.png')
    end

  end
end
