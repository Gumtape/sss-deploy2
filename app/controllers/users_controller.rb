class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all

    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])

    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user_new
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.fetch(:user, {}).permit(:name, :pass)
  end
end
