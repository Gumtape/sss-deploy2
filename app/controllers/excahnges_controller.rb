class ExchangesController < ApplicationController
    # GET /cources
    def index
      @exchanges = exchange.all

      render 'index', formats: 'json', handlers: 'jbuilder'
    end
  
    # GET /cources/:name
    def show
      @exchange = Exchange.find(params[:id])
      
      render 'show', formats: 'json', handlers: 'jbuilder'
    end
  
    # POST /cources
    def create
      @exchange = Exchange.new(exchange_params)

      if @exchange.save
        render json: @exchange, status: :created, location: @exchange_new
      else
        render json: @exchange.errors, status: :unprocessable_entity
      end
    end
  
    private
    # Only allow a trusted parameter "white list" through.
    def exchange_params
      params.fetch(:exchange, {}).permit(:user_id, :course_id, :QR)
    end
  end