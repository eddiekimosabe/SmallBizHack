class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
    	t.integer :flagger_id
    	t.integer :flagged_id
    	t.integer :flagged_invoice_id
    end
  end
end
