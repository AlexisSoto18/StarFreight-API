class Api::V1::RoutesController < ApplicationController
  before_action :set_route, only: [ :show, :update, :destroy ]

  def index
    @routes = Route.all
    render json: @routes
  end

  def show
    render json: @route
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      render json: @route, status: :created
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      render json: @route, status: :ok
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy
    render json: { message: "Route deleted successfully" }, status: :ok
  end

  private

  def set_route
    @route = Route.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Route not found" }, status: :not_found
  end

  def route_params
    params.expect(route: [ :origin, :destination, :distance ])
  end
end
