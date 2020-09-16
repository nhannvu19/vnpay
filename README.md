VNPay
========

A Ruby gem for VNPay integration

Introduction
------------

VNPAY Payment Gateway is an intermediate system to transmit, exchange and process payment transactions between consumers owning card, bank account or e-wallet and enterprises providing goods, services on the Internet.

Installation
------------

### Bundler

Add the Airbrake gem to your Gemfile:

```ruby
gem 'vnpay'
```

### Manual

Invoke the following command from your terminal:

```bash
gem install vnpay
```

### Configuration

To integrate VNPay with your Rails application, you need to know your secret_key, payment URL and your website code. You can ask VNPay directly to get these information, then config them as following:

```ruby
Vnpay::Config.configure do |config|
  config.secret_key = ENV['VNPAY_SECRET_KEY']
  config.payment_url = ENV['VNPAY_PAYMENT_URL']
  config.website_code = ENV['VNPAY_WEBSITE_CODE']
end
```

### How to use

...


