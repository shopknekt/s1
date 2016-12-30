Spree::Price.class_eval do

  after_create :add_to_public_schema

  def add_to_public_schema
    current = Apartment::Tenant.current
    Apartment::Tenant.switch! 'public'
    dup.save! unless self.class.find_by(variant_id: variant_id, currency: currency)
    Apartment::Tenant.switch! current
  end
end