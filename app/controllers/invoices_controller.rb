class InvoicesController < ApplicationController

  def new
  	@invoice = Invoice.new
  end

  def index
  	@invoices = Invoice.all
  end

  def edit
  	@invoice = Invoice.find(params[:id])
  end

  def show
  	@invoices = Invoice.all
  end

  def update
  end

  def destroy
  	@invoice = Invoice.find(params[:id])
  	@invoice.destroy
  	redirect_to invoices_path
  end

end

private
def invoice_params

end

