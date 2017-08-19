class Store
  attr_accessor :name, :rating, :info_link, :street_address, :locality, :region, :website, :phone_number, :hours

  def initialize(store_hash)
    self.add_stores_attributes(store_hash)
  end

  def self.create_from_array(stores_array)
    stores_array.each {|store_hash| Store.new(store_hash)}
  end

  def add_stores_attributes(store_hash)
    store_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

end
