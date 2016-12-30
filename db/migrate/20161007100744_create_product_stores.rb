class CreateProductStores < ActiveRecord::Migration
  def change
    create_table :product_stores do |t|
      t.integer :spree_product_id, index: true
      t.timestamps null: false
    end
  end
end
