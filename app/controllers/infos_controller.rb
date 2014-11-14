class InfosController < ApplicationController

  def index
  end

  def show
    @data = Info.fetch(params[:id])
  end

end
