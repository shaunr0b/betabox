require 'spec_helper'

describe Artist do
  describe "create" do
    it "should create from fixture without errors" do
      artist = create(:artist)
      id = artist.id
      Artist.find(id).should eq artist
    end
  end
end