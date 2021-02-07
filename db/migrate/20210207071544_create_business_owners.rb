class CreateBusinessOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :business_owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :profile_image

      t.timestamps
    end
  end
end
