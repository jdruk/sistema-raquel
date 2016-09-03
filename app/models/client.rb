class Client < ActiveRecord::Base
    has_many :payments

    def selection_payment type
        self.payments.where payment_type: type
    end

    def debit
        value = value_group_client 0
        Client.valide_value value
    end

    def paid
        value = value_group_client 1
        Client.valide_value value
    end

    def self.valide_value value
        unless value.nil?
            return value
        end
        return 0.0
    end

    def cashier
        value = paid - debit
    end

    private
    def value_group_client a
        value = payments.group(:payment_type).sum(:price)
        value[a]
    end
end
