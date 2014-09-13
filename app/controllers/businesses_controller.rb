class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def index
    @businesses = Business.all
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business
    else
      redirect_to new_business_path
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    redirect_to @business
  end

  def edit
    @business = Business.find(params[:id])

  end

  def destroy
      @business = Business.find(params[:id])
      @business.destroy
      redirect_to businesses_path
  end

  def business_params
    params.require(:business).permit(:name)
  end
end
