FactoryGirl.define do

  factory :campaign do
    name                 "random"
    routes_text          "JFK - ATL"
    base_airlines        "Delta"
    comparative_airlines "Tarom"
    advance_days         14
    length_of_stay       5
    score                5

    trait :inactive do
      active             false
    end

    trait :active do
      active             true
    end
  end

end
