class Invoice < ActiveRecord::Base
  belongs_to :payer, class_name: "Business", foreign_key: :payer_id
  belongs_to :receiver, class_name: "Business", foreign_key: :receiver_id

  validates_presence_of :amount, :payer_id, :receiver_id, :due_date, :received_date

  def type(business)
    if business.id == receiver_id
      return "receivable"
    elsif business.id == payer_id
      return  "payable"
    else
      return nil
    end
  end
end
