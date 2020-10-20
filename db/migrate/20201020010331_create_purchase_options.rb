class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.string :purchasable_type
      t.integer :purchasable_id
      t.float :price
      t.integer :quality

      t.timestamps
    end
  end
end
