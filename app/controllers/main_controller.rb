class MainController < ApplicationController
  def index
    @artists = Artist.limit(10)
  end
end
