class InvoicesController < ApplicationController
 
  def new
    @business = Business.find(params[:business_id])
  	@invoice = @business.invoices.build
  end

  def create
    @business = Business.find(params[:business_id])
    @invoice = @business.invoices.build(invoice_params)
    @invoice.save
  end

  def index
    @business = Business.find(params[:business_id])
  	@invoices = @business.invoices
  end

  def edit
    @business = Business.find(params[:business_id])
  	@invoice = @business.invoices.find(params[:id])
  end

  def show
    @business = Business.find(params[:business_id])
    @invoice = @business.invoices.find(params[:id])
  end

  def update
    @business = Business.find(params[:business_id])
    @invoice = @business.invoices.find(params[:id])
    redirect_to @business
  end

  def destroy
    @business = Business.find(params[:business_id])
    @invoice = @business.invoices.find(params[:id])
  	@invoice.destroy
  	redirect_to business_invoices_path
  end

end

private
def invoice_params
  params.require(:invoice).permit(:amount, :type, :due_date, :paid_date, :received_date, :payer_id, :receiver_id)
end

