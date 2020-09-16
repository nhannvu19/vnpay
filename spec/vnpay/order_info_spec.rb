require 'spec_helper'

describe Vnpay::OrderInfo do
  describe '#created_at' do
    it 'transform value' do
      order_info = described_class.new
      order_info.created_at = Time.at(1364046539)

      expect(order_info.created_at).to eq '20130323204859'
    end
  end

  describe '#valid?' do
    let(:order_info) {
      order_info = described_class.new
      order_info.amount = 25_000_000
      order_info.created_at = Time.now
      order_info.order_type = 'BILL_PAYMENT'
      order_info.payment_ref = 'TXN-110231261'
      order_info.description = 'This is a bill'

      order_info
    }

    context 'missing attributes' do
      %i[order_type payment_ref amount description created_at].each do |attribute|
        context "missing #{attribute}" do
          it 'return false' do
            order_info.send("#{attribute}=", nil)
            expect(order_info.valid?).to be_falsey
          end
        end
      end
    end

    context 'attributes are enough' do
      it 'return true' do
        expect(order_info.valid?).to be_truthy
      end
    end
  end
end
