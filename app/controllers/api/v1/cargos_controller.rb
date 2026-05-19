class Api::V1::CargosController < ApplicationController
  before_action :set_cargo, only: [ :show, :update, :destroy ]

  def index
    @cargos = Cargo.all
    render json: @cargos
  end

  def show
    render json: @cargo
  end

  def create
    @cargo = Cargo.new(cargo_params)
    if @cargo.save
      render json: @cargo, status: :created
    else
      render json: @cargo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cargo.update(cargo_params)
      render json: @cargo, status: :ok
    else
      render json: @cargo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cargo.destroy
    render json: { message: "Cargo deleted successfully" }, status: :ok
  end

  private

  def set_cargo
    @cargo = Cargo.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Cargo not found" }, status: :not_found
  end

  def cargo_params
    params.expect(cargo: [ :description, :weight, :category, :status, :spaceship_id ])
  end
end
