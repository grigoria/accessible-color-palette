SCORES = [3, 4.5, 7]
MATCHES = {
  "Don't check" => 0,
  "At least 1"  => 1,
  "At least 2"  => 2,
  "At least 3"  => 3,
  "All"         => 4,
}

class SearchController < ApplicationController
  def index
  end

  def show
    begin
      @bg_color = Chroma.paint(URI.decode(params[:bg_color])).to_hex
    rescue Chroma::Errors::UnrecognizedColor
      redirect_to root_path, alert: "Wrong format"
      return
    end

    @page = (params[:page] || 0).to_i

    # filters
    @score = (params[:score] || SCORES[0]).to_f
    @matches = (params[:matches] || 0).to_i

    qs = {
      format: "json",
      orderCol: "score",
      sortBy: "DESC",
      hex: @bg_color[1..-1],
      numResults: 50,
      resultOffset: @page
    }.to_query

    @palettes = JSON.parse(Faraday.get(
      "http://www.colourlovers.com/api/palettes?#{qs}"
    ).body)
  end
end
