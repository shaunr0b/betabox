require 'spec_helper'

describe Venue do
  describe "create" do
    
    before(:each) do
      @venue = create(:venue)
    end
    
    it "should create from fixture without errors" do
      id = @venue.id
      Venue.find(id).should eq @venue
    end
    
    
    
  end
end