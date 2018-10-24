class CoursesController < ApplicationController
  # GET /courses
  def index
    @courses = Course.all

    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  # GET /courses/:name
  def show
    @course = Course.find(params[:id])
    
    #render json: @course
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  def search
    @course = Course.find(params[:id]).spot.where(name: params[:text])
    
    render 'search', formats: 'json', handlers: 'jbuilder'
  end

  def count
    @course = Course.where(id: params[:id])
    
    render 'count', formats: 'json', handlers: 'jbuilder'
  end

  def num
    @course = Course.count

    render 'num', formats: 'json', handlers: 'jbuilder'
  end
  # POST /courses
  def create
    @course = Course.new(course_params)
  #  raise

    if @course.save
      render json: @course, status: :created, location: @course_new
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def course_params
    #params.fetch(:course, {}).permit(:name, :spot_num)
    params.require(:course).permit(:name, :spot_count, spot_attributes: [:name, :GPS_X, :GPS_Y, :comment, :image_id])
  end
end