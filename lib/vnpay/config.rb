module Vnpay
  class Config
    def self.configuration
      @configuration ||= OpenStruct.new
    end
  
    def self.configure
      yield(configuration)
    end
  end
end
