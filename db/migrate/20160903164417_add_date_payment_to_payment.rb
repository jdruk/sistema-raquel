class AddDatePaymentToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :date_payment, :datetime
  end
end
