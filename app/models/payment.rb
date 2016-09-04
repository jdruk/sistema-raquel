class Payment < ActiveRecord::Base
    belongs_to :client

    #validates :client, presence: true

    enum payment_type: [:debito,:pago]

    def self.value_paid
        value = Payment.value_group_payment 1
        Payment.valide_value value
    end

    def self.value_debit
        value = Payment.value_group_payment 0
        Payment.valide_value value
    end

    def self.cashier
        Payment.value_paid - Payment.value_debit
    end

    def self.valide_value value
        unless value.nil?
            return value
        end
        return 0.0
    end

    private
    def self.value_group_payment a
        value = Payment.group(:payment_type).sum(:price)
        value[a]
    end
end
