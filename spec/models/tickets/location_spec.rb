require 'spec_helper'

describe Location do
  describe "create" do
    
    before(:each) do
      @location = create(:location)
    end
    
    it "should create from fixture without errors" do
      id = @location.id
      Location.find(id).should eq @location
    end
    
    
    
  end
end