class LinksController < ApplicationController
  def index
  end

  def edit
  end

  def destination
    @link = Link.find_by_id params[:token]
    if @link.nil?
      head :not_found, content_type: "text/html"
    else
      @hit = Hit.create link: @link, address: request.env['REMOTE_ADDR']
      redirect_to @link.destination
    end
  end

  def show
    @link = Link.find param[:token]
  end

  def new
  end
end
