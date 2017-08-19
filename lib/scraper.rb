require "nokogiri"
require "open-uri"
require "pry"
require_relative "store.rb"

class Scraper

  def self.search(location)
    # instantiate SearchTerm here?
    stores = []
    url = "http://www.knitmap.com/search_results?origin=#{location}"
    site = Nokogiri::HTML(open(url))

    site.css("div#location_list div.location").each do |store|
      #binding.pry
      if store.css("div.location-info h3.closed a").text == ""
        store_hash = Hash.new
        store_hash[:name] = store.css("div.location-info h3 a").text
        stars = store.css("div.rating-review img").collect do |star|
          star.attribute("alt").value
        end
        store_hash[:rating] = stars.count("Rating-star")
        store_hash[:info_link] = store.css("div.location-info h3 a").attribute("href").value
        #get more info link too!
        new_store = Store.new(store_hash)
        stores << new_store
        #binding.pry
      end
      #add new Store instance to SearchTerm instance
    end
    stores
  end

  def self.store_page(url)
    #takes in a url for an individual store_page
    #uses nokogiri and open uri to get data from site
    #parses data to get data for lys
      # store data will be stored in a hash with :name, :hours, :address
      # include :reviews?
      # push this into original store hash?
  end

end


Scraper.search("08901")
