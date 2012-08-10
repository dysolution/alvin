class Address < ActiveRecord::Base
  attr_accessible :building_name, :city, :state, :street_address_1, :street_address_2, :zipcode
  zipcode_regex = /^(\d{5}(-?(\d{4}))?)$/

  validates_length_of :city, within: 2..30
  validates_length_of :state, is: 2
  validates_length_of :street_address_1, within: 2..50
  validates_length_of :street_address_2, within: 2..50
  validates_format_of :zipcode, with: zipcode_regex

  def google_maps_url
    url = "http://maps.google.com/maps?daddr="
    url << google_destination_address
    url << "&ie=UTF8&om=1&iwloc=addr"
  end

  def google_destination_address
    addr = "#{space_to_plus street_address_1}"
    addr << ",#{space_to_plus street_address_2}"
    addr << ",#{city},#{state},#{zipcode}"
  end

  def space_to_plus(str)
    str.to_s.split.join("+")
  end
end
