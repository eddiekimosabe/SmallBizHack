class Invoice < ActiveRecord::Base
  belongs_to :payer, class_name: "Business", foreign_key: :payer_id
  belongs_to :receiver, class_name: "Business", foreign_key: :receiver_id
end
