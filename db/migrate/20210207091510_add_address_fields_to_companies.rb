class AddAddressFieldsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :line1, :string
    add_column :companies, :line2, :string
  end
end
