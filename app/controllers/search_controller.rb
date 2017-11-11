class SearchController < ApplicationController
  def index
  end

  def show
    @hex = params[:hex]

    @palettes = Faraday.get(
      "http://www.colourlovers.com/api/palettes?format=json&hex=#{@hex}"
    )
    @palettes = JSON.parse(@palettes.body)
  end
end
