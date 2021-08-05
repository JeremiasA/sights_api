class IconsController < ApplicationController
  before_action :set_icon, only: [:show, :update, :destroy]
  before_action :authorize_request
  # GET /icons
  def index
    @icons = if params[:name]
               Icon.find_by_name(params[:name])
             elsif params[:created]
               Icon.find_by_created(params[:created])
             elsif params[:cities]
               Icon.where(id: IconCity.select([:icon_id]).where(city_id: params[:cities]))
             else
               @icons = Icon.all
             end
      
    if @icons.respond_to?(:to_a)
      render json: @icons, each_serializer: IconSerializers::ListSerializer
    else
      render json: @icons, serializer: IconSerializers::ListSerializer
    end
  end

  # GET /icons/1
  def show
    render json: @icon, serializer: IconSerializers::DetailSerializer
  end

  # POST /icons
  def create
    @icon = Icon.new(icon_params)

    if @icon.save
      @icon.save_cities
      render json: @icon,
             status: :created,
             location: @icon,
             serializer: IconSerializers::DetailSerializer
    else
      render json: @icon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /icons/1
  def update
    if @icon.update(icon_params)
      @icon.update_cities
      render json: @icon, serializer: IconSerializers::DetailSerializer
    else
      render json: @icon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /icons/1
  def destroy
    @icon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icon
      @icon = Icon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def icon_params
      params.require(:icon).permit(:name, :image, :created, :height, :history, :image, cities_ids: [])
    end
end
