class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :amount
      t.type :string
      t.date :due_date
      t.date :paid_date
      t.date :received_date
      t.integer :payer_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
