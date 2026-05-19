class Api::V1::SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [ :show, :update, :destroy ]

  def index
    @spaceships = Spaceship.all
    render json: @spaceships
  end

  def show
    render json: @spaceship
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      render json: @spaceship, status: :created
    else
      render json: @spaceship.errors, status: :unprocessable_entity
    end
  end

  def update
    if @spaceship.update(spaceship_params)
      render json: @spaceship, status: :ok
    else
      render json: @spaceship.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @spaceship.destroy
    head :no_content
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Spaceship not found" }, status: :not_found
  end

  def spaceship_params
    params.expect(spaceship: [ :name, :model, :max_capacity, :status ])
  end
end
