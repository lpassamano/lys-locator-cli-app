class Store
  attr_accessor :name, :rating, :info_link, :street_address, :region, :website, :phone_number, :hours

  @@current_search = []

  def initialize(store_hash)
    self.add_stores_attributes(store_hash)
  end

  def add_stores_attributes(store_hash)
    store_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def self.current_search
    @@current_search
  end

  def self.current_search= (array)
    @@current_search = array
  end

end
