class Address < ActiveRecord::Base
  attr_accessible :building_name, :city, :state, :street_address_1, :street_address_2, :zipcode
  zipcode_regex = /^(\d{5}(-?(\d{4}))?)$/

  validates :street_address_1, length: { maximum: 50 }
  validates :street_address_2, length: { maximum: 50 }
  validates :state, length: { maximum: 2 }
  validates :zipcode, format: { with: zipcode_regex }

  def google_maps_url
    url = "http://maps.google.com/maps?daddr="
    url << "#{space_to_plus street_address_1}"
    url << ",#{space_to_plus street_address_2}"
    url << ",#{city},#{state},#{zipcode}"
    url << "&ie=UTF8&om=1&iwloc=addr"
  end

  def space_to_plus(str)
    str.to_s.split.join("+")
  end
end
