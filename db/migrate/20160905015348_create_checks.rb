class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :bank
      t.string :agency
      t.string :account
      t.string :number_check
      t.string :holder
      t.float :value_check
      t.date :date_emission
      t.integer :status_check
      t.string :phone_one
      t.string :phone_two
      t.text :description
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
