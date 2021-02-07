class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :company
      t.float :amount
      t.integer :status

      t.timestamps
    end
  end
end
