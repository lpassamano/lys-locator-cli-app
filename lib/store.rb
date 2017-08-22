class Store
  attr_accessor :name, :rating, :info_link, :street_address, :region, :website, :phone_number, :hours

  @@all = []

  def initialize(store_hash)
    self.add_stores_attributes(store_hash)
  end

  def add_stores_attributes(store_hash)
    store_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def self.all
    @@all
  end

  def self.all= (array)
    @@all = array
  end

end
