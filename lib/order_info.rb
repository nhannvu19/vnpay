class OrderInfo
  attr_accessor :payment_ref, :amount, :description, :created_at

  def created_at=(value)
    @created_at = value.strftime('%Y%m%d%H%M%S')
  end
end
