module Vnpay
  class OrderInfo
    attr_accessor :order_type, :payment_ref, :amount, :description, :created_at

    def initialize(attributes = {})
      assign_attributes(attributes)
    end

    def assign_attributes(attributes = {})
      attributes.each do |key, value|
        send("#{key}=", value)
      end
    end

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
