module Vnpay
  class Verify

    REJECTED_PARAMS = %w[vnp_SecureHashType vnp_SecureHash controller action].freeze

    attr_reader :params, :normalized_params

    def initialize(params)
      @params = params.permit!.to_h
    end

    def verify
      normalize_params

      return false unless success_code?
      return false unless valid_hash?

      true
    end

    private

    def success_code?
      params['vnp_ResponseCode'] == '00'
    end

    def valid_hash?
      params['vnp_SecureHash'] == calculated_secure_hash
    end

    def calculated_secure_hash
      REJECTED_PARAMS.each { |key| params.delete(key) }
      data = params.sort.map { |k, v| "#{k}=#{v}" }.join('&')
      Digest::MD5.hexdigest(Vnpay::Config.configuration.secret_key + data)
    end

    def normalize_params
      @normalized_params ||= {}
    end
  end
end
