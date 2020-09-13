require 'order_info'
require 'vnpay/url'
require 'vnpay/verify'

module Vnpay
  if defined?(Rails)
    require 'vnpay/engine'
  else
    require 'vnpay'
  end
end

class Vnpay
  def self.configuration
    @configuration ||= OpenStruct.new
  end

  def self.configure
    yield(configuration)
  end
end
