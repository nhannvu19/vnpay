require 'lib/vnpay/url'
require 'lib/vnpay/verify'
require 'order_info'

class Vnpay
  def self.configuration
    @configuration ||= OpenStruct.new
  end

  def self.configure
    yield(configuration)
  end
end
