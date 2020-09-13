require 'order_info'
require 'vnpay/url'
require 'vnpay/verify'

class Vnpay
  def self.configuration
    @configuration ||= OpenStruct.new
  end

  def self.configure
    yield(configuration)
  end
end