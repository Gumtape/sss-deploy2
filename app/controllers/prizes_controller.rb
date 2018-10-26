class PrizesController < ApplicationController
  #GET prizes
  def index
    @prizes = Prize.all

    render json: @prizes
  end

  #GET prizes/:id
  def show
    @prize = Prize.where "course_id == ? and name == ?",params[:id],params[:name]

    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  def create
    @prize = Prize.new(prize_params)

    if @prize.save
      render json: @prize, status: :created, location: @prize_new
    else
      render json: @prize.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def prize_params
    params.require(:prize).permit(:course_id, :name, :location, :description)
  end
end
