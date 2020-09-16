module Vnpay
  class Url
    attr_accessor :order_info, :ip_address, :callback_url

    def initialize(order_info, ip_address, callback)
      @order_info = order_info
      @ip_address = ip_address
      @callback_url = callback_url
    end

    def generate
      raise "OrderInfo missing attributes" unless order_info.valid?
      config.payment_url + query_string + "&vnp_SecureHashType=MD5&vnp_SecureHash=#{secure_hash}"
    end

    private

    def query_string
      initiate_request.map { |k, v| "#{url_encode(k)}=#{url_encode(v)}" }.join('&')
    end

    def secure_hash
      data = initiate_request.sort.map { |k, v| "#{k}=#{v}" }.join('&')
      Digest::MD5.hexdigest(config.secret_key + data)
    end

    def initiate_request
      {
        vnp_Amount:       order_info.amount.to_i * 100,
        vnp_Command:      'pay',
        vnp_CreateDate:   order_info.created_at.to_i,
        vnp_CurrCode:     'VND',
        vnp_IpAddr:       ip_address,
        vnp_Locale:       'vn',
        vnp_OrderInfo:    order_info.description.to_s,
        vnp_OrderType:    order_info.order_type.to_s,
        vnp_ReturnUrl:    callback_url,
        vnp_TmnCode:      config.website_code,
        vnp_TxnRef:       order_info.payment_ref.to_s,
        vnp_Version:      "2.0.0"
      }
    end

    def config
      @config ||= Vnpay::Config.configuration
    end

    def url_encode(string)
      Rack::Utils.escape(string)
    end
  end
end
