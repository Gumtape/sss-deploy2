class CreatePrizes < ActiveRecord::Migration[5.2]
  def change
    create_table :prizes do |t|
      t.integer :cource_id
      t.string :name
      t.text :location
      t.text :description
      t.string :image
      t.binary :data

      t.timestamps
    end
  end
end
