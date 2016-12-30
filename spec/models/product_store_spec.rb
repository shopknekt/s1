# == Schema Information
#
# Table name: product_stores
#
#  id               :integer          not null, primary key
#  spree_store_id   :integer
#  spree_product_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe ProductStore, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
