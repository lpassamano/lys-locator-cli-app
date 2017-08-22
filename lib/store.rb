class Store
  attr_accessor :name, :rating, :info_link, :street_address, :region, :website, :phone_number, :hours

  @@current_search = []

  def initialize(store_hash)
    self.add_store_attributes(store_hash)
  end

  def self.new_search(location)
    self.current_search = Scraper.new.search(location)
  end

  def add_store_attributes(store_hash)
    store_hash.each do |store_attribute, store_value|
      self.send(("#{store_attribute}="), store_value)
    end
  end

  def self.current_search
    @@current_search
  end

  def self.current_search=(array)
    @@current_search = array
  end

end
