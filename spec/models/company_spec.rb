require 'spec_helper'

describe Company do
  
  before(:each) do
   Company.delete_all
   @company = create(:company)
   @company_with_venues = create(:company_with_venues)
  end
  
  describe "plain" do
    it "should create from fixture without errors" do
      id = @company.id
      Company.find(id).should eq @company
    end
    
    
    it "should reject duplicate subdomains" do
      co = @company.dup
      co.should_not be_valid
    end
    
  end
  
  
  describe "with venues" do
    
    it "should create with venues without errors" do
      Company.find(@company_with_venues.id).should eq @company_with_venues
    end
    
    it "should have at least one venue" do
      @company_with_venues.venues.count.should eq 2
    end
    
    it "should have a valid venue" do
      @company_with_venues.venues.last.should be_valid
    end
    
    it "should reflect inverse properties" do
      names = ['ABC Co', "XYZ Co"]
      subdomain = 'abc123'
      
      c = Company.create(:name => names[0], :subdomain =>subdomain)
      v = Venue.create(:name => "Awesome Venue")
      c.venues << v
      c.save!
      c.name = names[1]
      v.company.name.should eq c.name
    end
    
    it "should delete venue with company delete" do
      v = @company_with_venues.venues.last
      @company_with_venues.delete
      v.should eq nil
    end
  end
end