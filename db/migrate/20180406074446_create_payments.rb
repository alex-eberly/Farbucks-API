class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.integer :transaction_id, limit: 8
      t.text :response

      t.timestamps
    end
  end
end
