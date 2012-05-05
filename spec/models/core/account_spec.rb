require 'spec_helper'

describe Account do
  
  before(:each) do
   Account.delete_all
   @account = create(:account)
   @account_with_locations = create(:account_with_locations)
  end
  
  describe "plain" do
    it "should create from fixture without errors" do
      id = @account.id
      Account.find(id).should eq @account
    end
    
    
    it "should reject duplicate subdomains" do
      co = @account.dup
      co.should_not be_valid
    end
    
  end
  
  
  describe "with locations" do
    
    it "should create with locations without errors" do
      Account.find(@account_with_locations.id).should eq @account_with_locations
    end
    
    it "should have at least one location" do
      @account_with_locations.locations.count.should eq 2
    end
    
    it "should have a valid location" do
      @account_with_locations.locations.last.should be_valid
    end
    
    it "should reflect inverse properties" do
      names = ['ABC Co', "XYZ Co"]
      subdomain = 'abc123'
      
      c = Account.create(:name => names[0], :subdomain =>subdomain)
      v = Location.create(:name => "Awesome Location")
      c.locations << v
      c.save!
      c.name = names[1]
      v.account.name.should eq c.name
    end
    
    it "should delete location with account delete" do
      v = @account_with_locations.locations.last
      @account_with_locations.delete
      v.should eq nil
    end
  end
end