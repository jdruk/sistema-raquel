class Payment < ActiveRecord::Base
    belongs_to :client

    #validates :client, presence: true

    enum payment_type: [:debito,:pago]
end
