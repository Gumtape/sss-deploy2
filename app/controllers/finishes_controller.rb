class FinishesController < ApplicationController
    # GET /cources
    def index
      @finishes = Finish.all

      render 'index', formats: 'json', handlers: 'jbuilder'
    end
  
    # GET /finishes/:user_id/:cource_id/spot_id
    def show
      @finish = Finish.where "user_id == ? and course_id == ? and spot_id == ?",params[:user_id].to_i,params[:course_id].to_i,params[:spot_id].to_i
      if @finish != []
        render :json => {'result' => 'true'}
        #render json: @finish
      else
        render :json => {'result' => 'false'}
        #render json: @finish
      end
    end
  
    # POST /cources
    def create
      @finish = Finish.new(finish_params)
  
      if @finish.save
        render json: @finish, status: :created, location: @finish_new
      else
        render json: @finish.errors, status: :unprocessable_entity
      end
    end
  
    private
    # Only allow a trusted parameter "white list" through.
    def finish_params
      params.fetch(:finish, {}).permit(:user_id, :course_id, :spot_id)
    end
  end