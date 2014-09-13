class User < ActiveRecord::Base
  has_secure_password
  has_one :business
  has_many :payable_invoices, :through => :business, class_name: "Invoice", foreign_key: "payer_id"
  has_many :receivable_invoices, :through => :business, class_name: "Invoice", foreign_key: "receiver_id"

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_length_of :password, :in => 8..20, :on => :create
end
