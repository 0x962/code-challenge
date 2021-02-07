class SetTimestampsForOldRecords < ActiveRecord::Migration[6.0]
  def change
    Company.all.update_all(created_at: 4.days.ago, updated_at: 2.days.ago)
  end
end
