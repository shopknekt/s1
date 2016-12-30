Spree::Product.class_eval do
  def self.spree_base_scopes
    where(id: ProductStore.pluck(:spree_product_id))
  end
end