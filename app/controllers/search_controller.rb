class SearchController < ApplicationController
  def index
  end

  def show
    begin
      @hex = Chroma.paint(params[:hex]).to_hex
    rescue Chroma::Errors::UnrecognizedColor
      redirect_to root_path, alert: "Wrong format"
      return
    end

    @palettes = JSON.parse(Faraday.get(
      "http://www.colourlovers.com/api/palettes?format=json&hex=#{@hex[1..-1]}"
    ).body)
  end
end
