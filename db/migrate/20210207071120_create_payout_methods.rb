class CreatePayoutMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :payout_methods do |t|
      t.integer :method_type
      t.references :company

      t.timestamps
    end
  end
end
