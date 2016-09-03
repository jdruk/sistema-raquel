class Client < ActiveRecord::Base
    has_many :payments

    def selection_payment type
        self.payments.where payment_type: type
    end
end
