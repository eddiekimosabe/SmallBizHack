class Flag < ActiveRecord::Base
	belongs_to :flagger, class_name: "Business"
	belongs_to :flagged, class_name: "Business"
	belongs_to :flagged_invoice, class_name: "Invoice"

end