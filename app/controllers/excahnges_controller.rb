class ExchangesController < ApplicationController
  # GET /cources
  def index
    @exchanges = Exchange.all

    render json: @exchanges
  end

  # GET /cources/:name
  def show
    @exchange = Exchange.find(params[:id])
    
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  # POST /cources
  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.QR = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(15).join

    if @exchange.save
      render json: @exchange, status: :created, location: @exchange_new
    else
      render json: @exchange.errors, status: :unprocessable_entity
    end
  end

  def delete
    @exchange = Exchange.find_by(user_id: params[:user_id], course_id: params[:course_id])
    @exchange.update(exchange_params)
    @result = 'success!'
    render 'delete', formats: 'json', handlers: 'jbuilder'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def exchange_params
    params.fetch(:exchange, {}).permit(:user_id, :course_id, :QR)
  end
end