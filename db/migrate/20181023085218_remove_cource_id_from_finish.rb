class RemoveCourceIdFromFinish < ActiveRecord::Migration[5.2]
  def change
    remove_column :finishes, :cource_id, :integer
  end
end
