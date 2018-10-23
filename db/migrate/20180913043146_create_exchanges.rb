class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.integer :user_id
      t.integer :cource_id
      t.string :QR

      t.timestamps
    end
  end
end
