class Store

  def initialize(store_hash)
    #takes in the hash created by Scraper.search
    #creates new store with attributes based on keys
      #use #send
    #add new store to stores array
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
