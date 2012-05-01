class MainController < ApplicationController
  def index
    @artists = Artist.limit(20).order('name')
  end
end
