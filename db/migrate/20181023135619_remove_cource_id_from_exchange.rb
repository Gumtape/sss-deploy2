class RemoveCourceIdFromExchange < ActiveRecord::Migration[5.2]
  def change
    remove_column :exchanges, :cource_id, :integer
  end
end
