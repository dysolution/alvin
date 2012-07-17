class Address < ActiveRecord::Base
  attr_accessible :building_name, :city, :state, :street_address_1, :street_address_2, :zipcode
end
