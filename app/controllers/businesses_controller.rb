class BusinessesController < ApplicationController
  before_action :get_business, only: [:show, :update, :edit, :destroy, :report]
  before_action :require_logged_in_as_owner, only: [:show, :update, :edit, :destroy, :report]

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
  end

  def update
    @business.update(business_params)
    redirect_to @business
  end

  def edit
  end

  def destroy
    @business.destroy
    redirect_to businesses_path
  end

  def report

  end

  private
  def business_params
    params.require(:business).permit(:name)
  end

  def get_business
    @business = Business.find(params[:id])
  end
end
