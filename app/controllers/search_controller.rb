class SearchController < ApplicationController
  include ApplicationHelper

  def index
  end

  def show
    begin
      @bg_color = Chroma.paint(URI.decode(params[:bg_color])).to_hex
    rescue Chroma::Errors::UnrecognizedColor
      redirect_to root_path, alert: "Wrong format"
      return
    end

    # filters
    @page = (params[:page] || 0).to_i
    @level = params[:level] || "AA"
    @size = (params[:size] || SIZES).sort
    @size = @size[0] if @size.length == 1
    @ratio = Float(RATIOS[@level][@size])
    @matches = (params[:matches] || 1).to_i

    qs = {
      format: "json",
      orderCol: "score",
      sortBy: "DESC",
      hex: @bg_color[1..-1],
      numResults: 100,
      resultOffset: @page
    }.to_query

    @palettes = JSON.parse(Faraday.get(
      "http://www.colourlovers.com/api/palettes?#{qs}"
    ).body)
    puts "http://www.colourlovers.com/api/palettes?#{qs}"

    @palettes.select! { |p| passes?(p, @bg_color, @ratio, @matches) }
  end
end
