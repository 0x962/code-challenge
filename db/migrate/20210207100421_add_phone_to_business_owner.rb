class AddPhoneToBusinessOwner < ActiveRecord::Migration[6.0]
  def change
    add_column :business_owners, :phone, :string
  end
end
