class Store
  attr_accessor :name, :rating, :info_link, :street_address, :locality, :region, :website, :phone_number, :hours

  def initialize(store_hash)
    store_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def self.create_from_array(stores_array)
    stores_array.each {|store_hash| Store.new(store_hash)}
  end

  def add_stores_attributes(attributes_hash)
    #takes in the attributes_hash from Scraper.store_page
    #adds each key/attribute pair to the store hash
    #uses #send
  end

end
