class Payment < ActiveRecord::Base
    belongs_to :client

    #validates :client, presence: true

    enum payment_type: [:debito,:pago]

    def self.value_paid
        Payment.value_group_payment 1
    end

    def self.value_debit
        Payment.value_group_payment 0
    end

    def self.cashier
        Payment.value_paid - Payment.value_debit
    end

    private
    def self.value_group_payment a
        value = Payment.group(:payment_type).sum(:price)
        value[a]
    end
end
