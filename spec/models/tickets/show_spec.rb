require 'spec_helper'

describe Show do
  describe "create" do
    it "should create from fixture without errors" do
      show = create(:show)
      id = show.id
      Show.find(id).should eq show
    end
  end
end