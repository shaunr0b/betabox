require 'spec_helper'

describe Address do
  describe "create" do
    it "should create from fixture without errors" do
      address = create(:address)
      id = address.id
      Address.find(id).should eq address
    end
  end
end