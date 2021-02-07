class AddTwitterIdToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :twitter_id, :string
  end
end
