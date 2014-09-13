class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def index
    @businesses = Business.all
  end

  def edit
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business
    else
      redirect_to new_business
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name)
  end
end
