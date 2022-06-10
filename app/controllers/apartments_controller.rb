class ApartmentsController < ApplicationController
  def index
    apartments = Apartment.all
    render json: apartments, status: :found
  end

  def show
    apartment = find_apartment
    render json: apartment, status: :found
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    apartment = find_apartment
    apartment.update!(apartment_params)
    render json: apartment, status: :accepted
  end

  def destroy
    apartment = find_apartment
    apartment.destroy
    head :no_content
  end

  private

  def find_apartment
    Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:number)
  end
end
