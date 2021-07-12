class LinksController < ApplicationController
  before_action :set_link, only: %i[show edit update destroy]
  
  def destination
    @link = Link.find_by_id params[:token]
    if @link.nil?
      head :not_found, content_type: "text/html"
    else
      @hit = Hit.create link: @link, address: request.env['REMOTE_ADDR']
      redirect_to @link.destination
    end
  end

  def index
    @links = Link.all
  end

  def edit
  end

  def show
  end

  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1 or /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  private
  
  def set_link
    @link = Link.find params[:id]
  end
  
  def link_params
    params.require(:link).permit(:destination)
  end
end
