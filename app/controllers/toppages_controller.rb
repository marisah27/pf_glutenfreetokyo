class ToppagesController < ApplicationController
  def index
    @genre = Shop.where(genre: "italian")
  end
end
