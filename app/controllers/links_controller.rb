class LinksController < ApplicationController
  def index
  end

  def edit
  end

  def show
    @link = Link.find_by_id params[:token]
    if @link.nil?
      head 404, content_type: "text/html"
    else
      @hit = Hit.create link: @link, address: request.env['REMOTE_ADDR']
      redirect_to @link.destination
    end
  end

  def new
  end
end
