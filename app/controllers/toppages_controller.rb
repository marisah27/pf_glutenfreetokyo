class ToppagesController < ApplicationController
  def index
    @genre = Shop.where(genre: "italian")
    @count_shops = Shop.count
    @count_areas = Shop.group(:area).count
  end
  
end

