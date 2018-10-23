class PrizesController < ApplicationController
    #GET spots
    def index
      @spots = Spot.all
  
      render json: @spots
    end
  
    #GET spots/:id
    def show
      #@spot=Spot.find(params[:id])
      @spot = Spot.where "course_id == ? and name == ?",params[:id],params[:name]

      render 'show', formats: 'json', handlers: 'jbuilder'
    end
  
    def create
      @spot = Spot.new(spot_params)
  
      if @spot.save
        render json: @spot, status: :created, location: @spot_new
      else
        render json: @spot.errors, status: :unprocessable_entity
      end
    end
  
    def imageup
      spot = Spot.find(params[:id])
      spot.data = request.raw_post
      image.save!
      render json: spot, expect: [:data]
    end
  
    private
    # Only allow a trusted parameter "white list" through.
    def spot_params
      params.require(:spot).permit(:course_id, :name, :GPS_X, :GPS_Y, :image)
    end
  end
  