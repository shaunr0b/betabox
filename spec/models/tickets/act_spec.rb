require 'spec_helper'

describe Act do
  describe "create" do
    it "should create from fixture without errors" do
      act = create(:act)
      id = act.id
      Act.find(id).should eq act
    end
  end
end