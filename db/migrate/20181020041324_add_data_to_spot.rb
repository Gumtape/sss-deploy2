class AddDataToSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :data, :binary
  end
end
