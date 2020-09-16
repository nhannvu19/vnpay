module Vnpay
  class OrderInfo
    attr_accessor :order_type, :payment_ref, :amount, :description, :created_at

    def created_at=(value)
      @created_at = value&.strftime('%Y%m%d%H%M%S')
    end

    def valid?
      [:order_type, :payment_ref, :amount, :description, :created_at].map do |attribute|
        !!send(attribute)
      end.all?
    end
  end
end
