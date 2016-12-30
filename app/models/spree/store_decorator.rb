Spree::Store.class_eval do
  after_save :set_tenant

  def set_tenant
    Apartment::Tenant.create domain_name
  rescue Apartment::TenantExists
  end
end