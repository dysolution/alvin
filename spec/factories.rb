require 'factory_girl'

FactoryGirl.define do
  factory :address do
    building_name "Some Building"
    street_address_1 "123 Foo Street"
    street_address_2 "4th Floor"
    city "Footown"
    state "CA"
    zipcode "90210"
  end
end

