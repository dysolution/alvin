require 'spec_helper'

describe Address do
  context "validations" do
    before do
      @address = build :address
    end

    it "should require a zipcode" do
      @address.zipcode = nil
      @address.should_not be_valid
    end

    it "should require a valid zipcode" do
      @address.zipcode = "foo"
      @address.should_not be_valid
      @address.zipcode = "90210"
      @address.should be_valid
      @address.zipcode = "90210-1234"
      @address.should be_valid
    end

    it "should require a valid street address" do
      @address.street_address_1 = nil
      @address.should_not be_valid
      @address.street_address_1 = "a" * 51
      @address.should_not be_valid
      @address.street_address_1 = "a"
      @address.should_not be_valid
    end

    it "should require a valid city" do
      @address.city = nil
      @address.should_not be_valid
      @address.city = "a" * 31
      @address.should_not be_valid
      @address.city = "a"
      @address.should_not be_valid
    end

    it "should require a valid state" do
      @address.state = nil
      @address.should_not be_valid
    end

    it "should require a 2-letter state abbreviation" do
      @address.state = "California"
      @address.should_not be_valid
      @address.state = ""
      @address.should_not be_valid
      @address.state = "CA"
      @address.should be_valid
    end
  end

  context "when given valid attributes" do
    before do
      @address = build :address
    end

    it "should create a new instance with valid attributes" do
      @address.should be_valid
    end

    it "should construct a valid Google Maps URL" do
      @address.google_maps_url.should == "http://maps.google.com/maps?daddr=123+Foo+Street,4th+Floor,Footown,CA,90210&ie=UTF8&om=1&iwloc=addr"
    end
  end
end
