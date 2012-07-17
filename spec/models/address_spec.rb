require 'spec_helper'

describe Address do
  context "when given invalid attributes" do
  end

  context "when given valid attributes" do
    before(:each) do
      @valid_attributes = {
        building_name: "Some Building",
        street_address_1: "123 Foo Street",
        street_address_2: "4th Floor",
        city: "Footown",
        state: "CA",
        zipcode: "90210"
      }
    end

    it "should create a new instance with valid attributes" do
      Address.new(@valid_attributes).should be_valid
    end

    it "should construct a valid Google Maps URL" do
      address = Address.new(@valid_attributes)
      address.google_maps_url.should == "http://maps.google.com/maps?daddr=123+Foo+Street,4th+Floor,Footown,CA,90210&ie=UTF8&om=1&iwloc=addr"
    end
  end
end
