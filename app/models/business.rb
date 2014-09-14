class Business < ActiveRecord::Base
  belongs_to :user
  has_many :invoices
  has_many :payable_invoices, class_name: "Invoice", foreign_key: "payer_id"
  has_many :receivable_invoices, class_name: "Invoice", foreign_key: "receiver_id"
  has_many :received_flags, class_name: "Flag", foreign_key: "flagged_id"
  has_many :raised_flags, class_name: "Flag", foreign_key: "flagger_id"
  has_many :flagged_invoices, :through => "flags"
  has_many :flags

  validates_presence_of :name

  def invoices
  	Invoice.where('payer_id = ? OR receiver_id = ?', self.id, self.id)
  end

end
