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

How to use
------------

### Generate payment URL

To generate VNPAY payment URL, you have to use specific model to transform necessary information. Things we need to have are:
- Order Type: refer VNPAY documentation [here](https://sandbox.vnpayment.vn/apis/docs/loai-hang-hoa/)
- Payment Ref: to know the order that payment URL belongs to so you'll be able to confirm payment correctly.
- Amount: Order amount in Vietnam Dong.
- Description: Order description
- Created at: When the order is created

```ruby
order = Vnpay::OrderInfo.new(
  amount: 20_000_000,
  created_at: Time.at(1364046539),
  order_type: 'BILL_PAYMENT',
  payment_ref: 'TXN-110231261',
  description: 'This is a bill'
)
```

Once you have corresponding order info, simply use service to generate payment URL. The second param is user's IP address and the third one is your callback URL which system will automatically redirect to after user complete the payment

```ruby
payment_url = Vnpay::URL.new(order, '127.0.0.1', 'https://mydomain.com/vnpay/payment_complete')
```



...
