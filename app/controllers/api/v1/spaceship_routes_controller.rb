class Api::V1::SpaceshipRoutesController < ApplicationController
  before_action :set_spaceship
  before_action :set_spaceship_route, only: [ :show, :update, :destroy ]

  def index
    @spaceship_routes = @spaceship.spaceship_routes
    render json: @spaceship_routes
  end

  def show
    render json: @spaceship_route
  end

  def create
    @spaceship_route = @spaceship.spaceship_routes.new(spaceship_route_params)
    if @spaceship_route.save
      render json: @spaceship_route, status: :created
    else
      render json: @spaceship_route.errors, status: :unprocessable_entity
    end
  end

  def update
    if @spaceship_route.update(spaceship_route_params)
      render json: @spaceship_route, status: :ok
    else
      render json: @spaceship_route.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @spaceship_route.destroy
    render json: { message: "SpaceshipRoute deleted successfully" }, status: :ok
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:spaceship_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Spaceship not found" }, status: :not_found
  end

  def set_spaceship_route
    @spaceship_route = @spaceship.spaceship_routes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "SpaceshipRoute not found" }, status: :not_found
  end

  def spaceship_route_params
    params.expect(spaceship_route: [ :route_id ])
  end
end
