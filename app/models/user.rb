class User < ActiveRecord::Base
  has_secure_password
  has_one :business
  has_many :invoices, :through => :business

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_length_of :password, :in => 8..20, :on => :create
end
