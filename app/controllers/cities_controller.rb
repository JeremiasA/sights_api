class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]
  before_action :authorize_request
  # GET /cities
  def index
    @cities = if params[:name]
                City.find_by_name(params[:name])
              elsif params[:continent]
                @cities = City.all.where(continent: params[:continent])
              else
                City.all
              end

    if @cities.respond_to?(:to_a)
      render json: @cities, each_serializer: CitySerializers::ListSerializer
    else
      render json: @cities, serializer: CitySerializers::ListSerializer
    end
  end

  # GET /cities/1
  def show
    render json: @city, serializer: CitySerializers::DetailSerializer
  end

  # POST /cities
  def create
    @city = City.new(city_params)

    if @city.save
      @city.save_icons
      render json: @city, 
             status: :created,
             location: @city,
             serializer: CitySerializers::DetailSerializer
    else
      render json: @city.errors,
             status: :unprocessable_entity,
             serializer: CitySerializers::DetailSerializer
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      @city.save_icons
      render json: @city, serializer: CitySerializers::DetailSerializer
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name, :image, :habitants, :surface, :continent_id, :images, icons_ids: [])
    end
end
