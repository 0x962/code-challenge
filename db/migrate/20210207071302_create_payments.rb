class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :company
      t.references :payout_method
      t.references :invoice
      t.float :amount
      t.integer :status

      t.timestamps
    end
  end
end
