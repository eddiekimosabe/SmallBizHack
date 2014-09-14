class InvoicesController < ApplicationController
  before_action :get_business
  before_action :get_invoice, only: [:edit, :show, :update, :destroy]
  before_action :require_logged_in_as_owner

  def new
  	@invoice = @business.invoices.build
  end

  def create
    # @invoice = @business.invoices.build(invoice_params)
    @payer_business = Business.find_or_create_by(name: params[:payer_name])
    @receiver_business = Business.find_or_create_by(name: params[:receiver_name])
    @invoice = Invoice.new(invoice_params)
    @invoice.payer_id = @payer_business.id
    @invoice.receiver_id = @receiver_business.id
    if @invoice.save
      redirect_to business_invoices_path
    else
      render :new
    end
  end

  def index
  	@invoices = @business.invoices
  end

  def edit

  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def update
    @payer_business = Business.find_or_create_by(name: params[:payer_name])
    @receiver_business = Business.find_or_create_by(name: params[:receiver_name])
    @invoice.payer_id = @payer_business.id
    @invoice.receiver_id = @receiver_business.id
    @invoice.update(invoice_params)
    redirect_to business_invoices_path
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
    @invoice = Invoice.find(params[:id])
  end
end


