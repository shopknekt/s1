class AddDomainToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :domain_name, :string
  end
end
