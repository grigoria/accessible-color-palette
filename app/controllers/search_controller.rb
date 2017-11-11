class SearchController < ApplicationController
  def index
  end

  def show
    @a = params[:hex]
  end
end
