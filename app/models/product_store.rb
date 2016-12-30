# == Schema Information
#
# Table name: product_stores
#
#  id               :integer          not null, primary key
#  spree_product_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ProductStore < ActiveRecord::Base
  after_create :import_prices

  def import_prices
    product = Spree::Product.find(spree_product_id)
    current = Apartment::Tenant.current
    Apartment::Tenant.switch! 'public'
    prices = product.variants_including_master.flat_map(&:prices)
    Apartment::Tenant.switch! current
    prices.each{|p| p.dup.save! }
  ensure
    Apartment::Tenant.switch! current
  end
end
