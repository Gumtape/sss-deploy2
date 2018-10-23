class RemoveDataFromSpot < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :data, :binary
  end
end
