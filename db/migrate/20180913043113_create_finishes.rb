class CreateFinishes < ActiveRecord::Migration[5.2]
  def change
    create_table :finishes do |t|
      t.integer :user_id
      t.integer :cource_id
      t.integer :spot_id

      t.timestamps
    end
  end
end
