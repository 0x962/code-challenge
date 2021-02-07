class AddBusinessOwnerToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :business_owner
  end
end
