module ChartsHelper

  def set_up_vars_for_charts_api
    set_payable_vars
    set_receivable_vars
    set_net_vars
    set_x_axis
  end

  def sums
    sums = receivable_sums.zip(payable_sums).map {|array| array.inject(:+)}
    @sums = []
    sums.each_with_index do |x,v|
      @sums << x if v.eql?(0)
      @sums << x + sums.first(v).inject(:+) unless v.eql?(0)
    end
    @sums
  end

  def business
    @business ||= current_user.business if current_user
  end

  def payable
    @payable ||= business.payable_invoices.order('due_date ASC').group_by {|i| i.due_date }
  end

  def receivable
    @receivable ||= business.receivable_invoices.order('due_date ASC').group_by {|i| i.due_date }
  end

  def keys
    @keys ||= payable.merge(receivable).keys.sort!
  end

  def set_net_vars
    @net_vars ||= sums.to_s.gsub(/[\[\]]/, '')
  end

  def set_payable_vars
    @payable_vars ||= payable_sums.to_s.gsub(/[\[\]]/, '')
  end

  def set_receivable_vars
    @receivable_vars ||= receivable_sums.to_s.gsub(/[\[\]]/, '')
  end

  def receivable_sums
    @receivable_sums ||= keys.collect do |key|
      if receivable.has_key? key
        (receivable[key].collect {|s| s.amount}.inject{|sum,x| sum + x })
      else
        0
      end
    end
  end

  def payable_sums
    @payable_sums ||= keys.collect do |key|
      if payable.has_key? key
        -(payable[key].collect {|s| s.amount}.inject{|sum,x| sum + x })
      else
        0
      end
    end
  end

  def set_x_axis
    @x_axis ||= keys.collect{|key| key.to_s}.to_s.gsub(/[\[\]]/, '')
  end
end
