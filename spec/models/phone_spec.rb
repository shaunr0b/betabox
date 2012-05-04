require 'spec_helper'

describe Phone do
  describe "create" do
    it "should create from fixture without errors" do
      phone = create(:phone)
      id = phone.id
      Phone.find(id).should eq phone
    end
  end
end