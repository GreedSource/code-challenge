class CreateSale < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :quantity
      t.references :client, index:true, foreign_key: true
      t.references :product, index:true, foreign_key: true
      t.references :vendor, index:true, foreign_key: true
      t.timestamps
    end
  end
end
