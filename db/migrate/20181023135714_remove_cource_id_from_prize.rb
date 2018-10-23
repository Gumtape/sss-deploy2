class RemoveCourceIdFromPrize < ActiveRecord::Migration[5.2]
  def change
    remove_column :prizes, :cource_id, :integer
  end
end
