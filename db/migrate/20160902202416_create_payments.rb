class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :price
      t.integer :payment_type, default: 0, null: false
      t.text :description
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
