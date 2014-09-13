class InvoicesController < ApplicationController
  before_action :get_business
  before_action :get_invoice, only: [:edit, :show, :update, :destroy]
  before_action :require_logged_in_as_owner

  def new
  	@invoice = @business.invoices.build
  end

  def create
    @invoice = @business.invoices.build(invoice_params)
    @invoice.save
  end

  def index
  	@invoices = @business.invoices
  end

  def edit
  end

  def show
  end

  def update
    @invoice.update(invoice_params)
    redirect_to @business
  end

  def destroy
  	@invoice.destroy
  	redirect_to business_invoices_path
  end

  private
  def invoice_params
    params.require(:invoice).permit(:amount, :type, :due_date, :paid_date, :received_date, :payer_id, :receiver_id)
  end

  def get_business
    @business = Business.find(params[:business_id])
  end

  def get_invoice
    @invoice = @business.invoices.find(params[:id])
  end
end


