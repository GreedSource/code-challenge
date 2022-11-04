class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :price
      t.timestamps
    end
  end
end
